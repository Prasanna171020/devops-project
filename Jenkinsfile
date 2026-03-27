pipeline {
    agent any
    tools {
        maven 'Maven3'
        jdk 'JDK17'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Prasanna171020/devops-project.git'
            }
        }

        stage('Lint') {
            steps {
                sh 'mvn checkstyle:check'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn package -DskipTests'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.build("docimage:${env.BUILD_ID}", "-f docker/Dockerfile .")
                }
                sh '''
                    docker stop doccont || true
                    docker rm doccont || true
                    docker run -d --name doccont -p 8081:8080 docimage:${BUILD_ID}
                '''
            }
        }
    }
}
