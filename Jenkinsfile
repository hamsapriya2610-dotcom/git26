pipeline {
    agent any

    stages {

        stage('Load Config') {
            steps {
                script {
                    def props = readProperties file: 'config.properties'
                    
                    props.each { key, value ->
                        env."${key}" = value
                    }
                }
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('Sonarqube') {
                    sh 'mvn sonar:sonar -Dsonar.projectKey=Sonarqubedemo1'
                }
            }
        }

        stage('Quality Gate') {
            steps {
                timeout(time: 10, unit: 'MINUTES') {
                    waitForQualityGate abortPipeline: true
                }
            }
        }
    }
}
