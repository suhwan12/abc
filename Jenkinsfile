pipeline{
    agent { dockerfile true }
    
    stages {
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/suhwan12/abc.git'
            }
        }
        stage('maven build & test'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('build docker image'){
            steps{
                sh 'docker image build -t my_pipeine:v1 .'
            }
        }
    }
}
