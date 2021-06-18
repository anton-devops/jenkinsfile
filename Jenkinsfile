pipeline {
    agent {
        label 'wp-plugin-agent'
    }

    stages {
        stage('copy from git repo to peerboard dir'){
            steps{
                sh 'sudo mkdir -p /opt/bitnami/wp-content/plugins/peerboard'
                sh 'sudo rsync -av --delete ${PWD}/ /opt/bitnami/wp-content/plugins/peerboard/'
                sh 'rm -rf /opt/bitnami/wp-content/plugins/peerboard/.git*'
            }
        }
        stage('print list of new files'){
            steps{
                sh 'ls -la /opt/bitnami/wp-content/plugins/peerboard/'
            }
        }        
    }
}

