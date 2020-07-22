pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                dir("instal dependencies") {
                    sh "yarn i"
                }
            }
        }

        stage('Lint') {
            steps {
                dir("ketran-webapp") {
                    sh "yarn lint"
                }
            }
        }

        stage('Test') {
            steps {
                dir("ketran-webapp") {
                    sh "yarn test"
                }
            }
        }

        stage('Docker') {
            steps {
                def currentCommit = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
                def tagName = "hojarasca/ketran-webapp:${currentCommit}"

                dir("ketran-webapp") {
                    sh "docker build -t ${tagName} ."
                }
                sh "docker push ${tagName}"
                sh "docker image rm ${tagName}" // Save disk space.
            }
        }

        stage('Deploy') {
            steps {
                dir('deploy/kubernetes') {
                    sh 'kubectl apply -f ketran-webapp-deployment.yml'
                    sh 'kubectl apply -f ketran-webapp-service.yml'
                }
            }
        }
    }
}
