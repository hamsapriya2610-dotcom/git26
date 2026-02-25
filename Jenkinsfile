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
                    sh 'mvn clean verify sonar:sonar \
                    -Dsonar.projectKey=Sonarqubedemo1 \
                    -Dsonar.host.url=http://13.60.43.159:9000 \
                    -Dsonar.login=sqp_04365df7a44227909b6f1b41dfb95bbce56db419'
                }
            }
        }

    
            }
        }


