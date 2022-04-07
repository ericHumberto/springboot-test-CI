pipeline {
    agent any
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                sh './gradlew assemble'
            }
        }
         stage('Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh './gradlew docker'
            }
        }
        stage('Push Docker Image') {
            environment {
                DOCKER_HUB_LOGIN = credentials('dockerhub')
            }
            steps {
                sh 'docker login --username=$DOCKER_HUB_LOGIN_USR --password=$DOCKER_HUB_LOGIN_PSW'
                sh './gradlew dockerPush'
            }
        }
        stage('Promote') {
            environment {
                OKTETO_NAMESPACE = credentials('okteto-namespace')
                OKTETO_SECRET = credentials('okteto-secret')
            }
            steps {
                sh '''
                okteto login --token ${SECRET}
                okteto namespace ${OKTETO_NAMESPACE}
                okteto up
                '''
            }
        }
    }
}