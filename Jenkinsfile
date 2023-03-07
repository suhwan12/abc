pipeline{
    agent{
        label 'jenkins-node'
    }
    triggers {
       pollSCM '* * * * *'
    }
    parameters {
      string defaultValue: '172.31.45.89', name: 'TOMCAT_IP'
      string defaultValue: 'ubuntu', name: 'TOMCAT_LOGIN_USER'
      string defaultValue: '/var/lib/tomcat9/webapps', name: 'TOMCAT_WEBAPP_DIR'
    }

    stages{
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/suhwan12/abc.git'
            }
        }
        stage('Build'){	  
	    tools{
	      jdk 'Java-11'
	      maven 'Maven-3'
	    }
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Deploy'){
            steps{
		sh 'scp ${env.WORKSPACE}/target/*.war ${params.TOMCAT_LOGIN_USER}@${params.TOMCAT_IP}:${params.TOMCAT_WEBAPP_DIR}'
            }
        }
    }
}
