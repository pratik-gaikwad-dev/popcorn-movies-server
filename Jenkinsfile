pipeline {
    agent any
    stages {
        stage('Installing Packages') {
            steps {
                echo 'Building..'
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building docker image....'
                sh 'docker build -t popcorn-movies-server .'
            }
        }
    }
}