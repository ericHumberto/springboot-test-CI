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
        stage('SCA') {
            steps {
                sh 'trivy image andersoncmciet/springboot-test-ci:0.0.1-SNAPSHOT'
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
    }
}