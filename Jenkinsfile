pipeline {
    agent any
    tools {
        maven 'maven3.6.1'
        // jdk 'jdk8'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage('Build') { 
            steps {
                sh 'mvn -B -DskipTests clean package'
                script {
                    docker.withRegistry('http://127.0.0.1:8082/repository/Automat-it_docker/', 'nexus') {
                        def ttImage = docker.build("time-tracker-image:${env.BUILD_ID}")
                        ttImage.push()
                    }
                }
            }
        }
    }
}