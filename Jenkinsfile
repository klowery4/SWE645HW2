pipeline {
    agent any

    environment { 
        registry = "kevin3022/hw1" 
        registryCredential = 'DOCKERHUB_ACCESS_KEY' 
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
                sh 'kubectl set image deployment/hw2-deploy hw2-deploy=kevin3022/hw1:${BUILD_NUMBER} -n namespacehw2'
            }
        }

        stage("Deploying to Rancher with load balancer"){
            steps {
                sh 'kubectl set image deployment/hw2-deploy-loadbalancer hw2-deploy-loadbalancer=kevin3022/hw1:${BUILD_NUMBER} -n namespacehw2'
            }
        }
    }
}