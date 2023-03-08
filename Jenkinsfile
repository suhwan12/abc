pipeline{
    agent none
    
    triggers{
	pollSCM '* * * * *'
    }

    parameters {
  	string name: 'IMAGE_NAME' , defaultValue: 'hello-world'
	string name: 'IMAGE_REGISTRY_ACCOUNT', defaultValue: 'suhwan11'
    }


    stages {
        stage('SCM Checkout'){
	    agent any
            steps{
                git branch: 'main', url: 'https://github.com/suhwan12/abc.git'
            }
        }
        stage('maven build project'){
	    agent{ docker { image 'maven:3-openjdk-8' }} 
            steps{
                sh 'mvn clean package -DskipTests=true'
            }
        }
	stage('Test Maven Project'){
	    agent { docker { image 'maven:3-openjdk-8'} }
	    steps{
	      sh 'mvn test'
	    }
	}
        stage('build docker image'){
	    agent any
            steps{
                sh "docker image build -t ${params.IMAGE_NAME} ."
            }
        }
	stage('Tagging Docker Image'){
	    agent any
	    steps{
		sh "docker image tag ${params.IMAGE_REGISTRY_ACCOUNT}/${params.IMAGE_NAME}"
	    }
	}
	stage('publishing Docker Image'){
	    agent any
	    steps{
		echo "pubish docker image"
	    }
	}

    }
}
