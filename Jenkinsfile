pipeline {
    agent any
    options {
        disableConcurrentBuilds()
    }
    stages {
        stage('Build image') {
            steps {
                sh "docker build . -t fongshway/jenkins"
            }
        }
        stage('Test image') {
            steps {
                sh "echo 'Tests go here'"
            }
        }
        stage('Push image') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://registry.hub.docker.com/fongshway/jenkins']) {
                  sh "docker push fongshway/jenkins"
                }
            }
        }
    }
}
