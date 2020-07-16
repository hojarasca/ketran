pipeline {
    agent any
    stages {
        stage('Build docker image') {
            dir("silicio-webapp") {
                sh "docker build -t silicio-webapp:latest ."
            }
        }
        stage('Destroy docker image') { // Save disk space.
            sh "docker image rm silicio-webapp:latest"
        }
        stage('Example task') {
            steps {
                sh 'echo "todo esta bien"'
            }
        }
    }
}
