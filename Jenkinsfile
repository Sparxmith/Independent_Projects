pipeline {
    agent {
        docker { image 'ubuntu:latest' }
    stages {
        stage('Test') {
            steps {
                sh 'php --version'
            }
        }
    }
}
