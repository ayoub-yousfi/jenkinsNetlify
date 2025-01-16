pipeline {
    agent any

    environment {
        NETLIFY_TOKEN = credentials('netlify_token') // Add your Netlify token in Jenkins credentials
        GIT_CREDENTIALS = credentials('github_auth') // Replace 'github_auth' with your credentials ID
        SITE_DIR = './index.html' // Replace with the path to your site
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/ayoub-yousfi/jenkinsNetlify.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building zip file for deployment'
                // Use curly braces to handle variables properly
                sh """
                zip -r ${SITE_DIR}.zip .
                echo 'Zip file created: ${SITE_DIR}.zip'
                ls -al ${SITE_DIR}.zip
                """
            }
        }

        stage('Deploy to Netlify') {
            steps {
                script {
                    // Securely pass sensitive variables
                    withEnv(["NETLIFY_TOKEN=${env.NETLIFY_TOKEN}"]) {
                        sh '''
                        echo "Checking if zip file exists"
                        ls -al ${SITE_DIR}.zip  # Check if the zip file exists

                        echo "Deploying to Netlify"
                        curl -H "Authorization: Bearer $NETLIFY_TOKEN" \
                             -F "file=@${SITE_DIR}.zip" \
                             -F "site_id=459bc124-f5cb-4955-a53c-552c8a868ea4" \
                             https://api.netlify.com/api/v1/sites/459bc124-f5cb-4955-a53c-552c8a868ea4/deploys
                        '''
                    }
                }
            }
        }
    }
}
