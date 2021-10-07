pipeline {
    agent any

    environment {
        DOCKERHUB_ACCESS_KEY = credentials('DOCKERHUB_ACCESS_KEY')
    }

    stages {
        stage("Building the Student Survey Image"){
            steps {
                script {
                    checkout scm
                    sh 'rm -rf *.war'
                    sh 'jar -cvf survey.war -C WebContent/ .'
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh "docker login -u kevin3022 -p 76hy7THy2T56"
                    def customImage = docker.build("kevin3022/hw1:${BUILD_TIMESTAMP}")
                }
            }
        }

        stage("Pushing Image to DockerHub"){
            steps {
                script {
                    sh 'docker push kevin3022/hw1:${BUILD_TIMESTAMP}'
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