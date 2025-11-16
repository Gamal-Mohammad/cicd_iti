pipeline {
    agent any

    stages {
        stage('Pull Code') {
            steps {
                sh '''
                git clone 'https://github.com/Gamal-Mohammad/cicd_iti.git'
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                cd /var/lib/jenkins/workspace/cicd
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
