pipeline {

    agent none

    environment {
        // env vars for both backend and frontend
        ENV="DEV"
        TEST_ID=credentials('test_secret')
    }

    stages {
        stage('Forum Backend Build') {
            agent { label 'master' }
            steps {
                sh 'echo $TEST_ID'
            }
        }
    }
}
