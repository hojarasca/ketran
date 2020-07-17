pipeline {
    agent any
    stages {
        stage('Build docker image') {
            steps {
                dir("ketran-webapp") {
                    sh "docker build -t ketran-webapp:latest ."
                }
            }
        }
        stage('Destroy docker image') { // Save disk space.
            steps {
                sh "docker image rm ketran-webapp:latest"
            }
        }
        stage('Example task') {
            steps {
                sh 'echo "todo esta bien"'
            }
        }
    }
}
