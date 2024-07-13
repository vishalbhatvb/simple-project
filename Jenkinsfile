pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                // Checkout the code from the Git repository
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/vishalbhatvb/simple-project.git']]])
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t 94233949/k8s:v0.0.$BUILD_ID . --no-cache'
                }
            }
        }
        stage('Push Image to Registry') {
            steps {
                script {
                    // Login to Docker Hub and push the Docker image
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh '''
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                        docker push 94233949/k8s:v0.0.$BUILD_ID
                        docker rmi 94233949/k8s:v0.0.$BUILD_ID
                        '''
                    }
                }
            }
        }
    }
}

