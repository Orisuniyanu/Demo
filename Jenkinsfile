pipeline {
    agent any
    environment {
        SNYK_TOKEN = credentials('snyk-api-token')
        IMAGE_NAME = "Demo:${BUILD_NUMBER}" 
    }
    stages {
        stage('Clone GitHub Repo') {
            steps {
                git 'https://github.com/Orisuniyanu/3mtt_Demo.git'
            }
        }

        stage('Build image from GitHub Repo') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Scan the Image with Snyk AI') {
            steps {
                sh '''
                    snyk auth $SNYK_TOKEN
                    snyk test --docker $IMAGE_NAME --file=Dockerfile
                '''
            }
        }
    }
}
