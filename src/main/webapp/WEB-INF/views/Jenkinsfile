pipeline{
    agent{
        label 'jenkins-node'
    }
    stages{
        stage('Checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/suhwan12/abc.git'
            }
        }
        stage('Build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Deploy'){
            steps{
                sh 'scp /var/lib/jenkins/workspace/test_pipeline/target/hello-world.war ubuntu@172.31.45.89:/var/lib/tomcat9/webapps'
            }
        }
    }
}
