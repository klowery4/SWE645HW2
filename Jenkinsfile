pipeline {
    agent any

    environment { 
        registry = "kevin3022/hw1" 
        registryCredential = 'kevin3022' 
        dockerImage = '' 
    }

    stages {
        stage("Building the Student Survey Image"){
            steps {
                script {
                    checkout scm
                    sh 'rm -rf *.war'
                    sh 'jar -cvf survey.war -C WebContent/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }

        stage("Pushing Image to DockerHub"){
            steps {
                script {
                    docker.withRegistry('', registryCredential) { 
                        dockerImage.push() 
                    }
                }
            }
        }

        stage("Deploying to Rancher as single pod"){
            steps {
                sh 'kubectl set image deployment/stusurvey-pipeline stusurvey-pipeline=kevin3022/hw1:${BUILD_TIMESTAMP} -n jenkins-pipeline'
            }
        }

        stage("Deploying to Rancher with load balancer"){
            steps {
                sh 'kubectl set image deployment/studentsurvey645-lb studentsurvey645-lb=kevin3022/hw1:${BUILD_TIMESTAMP} -n jenkins-pipeline'
            }
        }
    }
}