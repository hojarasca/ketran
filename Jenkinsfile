def currentCommit() {
    return sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
}

pipeline {
    agent any
    stages {
        stage('Build, lint and test') {
            steps {
                dir("ketran-webapp") {
                    sh "yarn"
                    sh "yarn lint"
                    sh "yarn test"
                }
            }
        }

        stage('Docker') {
            environment {
                TAG_NAME = "hojarasca/ketran-webapp:${currentCommit()}"
            }
            steps {
                

                dir("ketran-webapp") {
                    sh "docker build -t $TAG_NAME ."
                }
                sh "docker push $TAG_NAME"
                sh "docker image rm $TAG_NAME" // Save disk space.
            }
        }

        stage('Deploy') {
            steps {
                dir('deploy/kubernetes') {
                    sh "sed 's/latest/${currentCommit()}/g' ketran-webapp-deployment.yml | kubectl apply -f -"
                    sh 'kubectl apply -f ketran-webapp-service.yml'
                }
            }
        }
    }
}
