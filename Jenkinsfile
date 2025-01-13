pipeline {
    agent any

    environment {
        NETLIFY_TOKEN = credentials('netlify_token') // Ajouter votre token dans les credentials Jenkins
        GIT_CREDENTIALS = credentials('github_auth') // Replace 'git_credentials' with your credentials ID
        SITE_DIR = './index.html'       // Remplacez par le c hemin de votre site
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/ayoub-yousfi/jenkinsNetlify.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh """
                if ! command -v zip > /dev/null; then
                    echo "Installing zip..."
                    sudo apt-get update && sudo apt-get install zip -y
                else
                    echo "zip is already installed."
                fi
                """
            }
        }


        stage('Build') {
            steps {
                echo 'Building zip file for deployment'
                // Use curly braces to handle variable properly
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
                    sh """
                    echo "Checking if zip file exists"
                    ls -al $SITE_DIR.zip  // Check if the zip file exists
                    curl -H "Authorization: Bearer $NETLIFY_TOKEN" \
                         -F "file=@$SITE_DIR.zip" \
                         -F "site_id=459bc124-f5cb-4955-a53c-552c8a868ea4" \
                         https://api.netlify.com/api/v1/sites/459bc124-f5cb-4955-a53c-552c8a868ea4/deploys
                    """
                }
            }
        }
    }
}