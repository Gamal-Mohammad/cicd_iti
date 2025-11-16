pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                git 'https://github.com/<your-username>/cicd-project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t cicd_app:latest .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker rm -f cicd_app || true
                docker run -d --name cicd_app -p 90:80 cicd_app:latest
                '''
            }
        }
    }

    triggers {
        pollSCM('H/5 * * * *')
    }
}
