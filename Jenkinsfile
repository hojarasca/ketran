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

        state('Test') {
            steps {
                dir("ketran-webapp") {
                    sh "yarn test"
                }
            }
        }

        stage('Docker') {
            steps {
                def GIT_COMMIT_HASH = sh (script: "git log -n 1 --pretty=format:'%H'", returnStdout: true)
                def tagName = "hojarasca/ketran-webapp:${GIT_COMMIT_HASH}"
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
