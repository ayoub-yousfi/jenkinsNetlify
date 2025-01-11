pipeline {
    agent any

    environment {
        NETLIFY_TOKEN = credentials('netlify_token') // Ajouter votre token dans les credentials Jenkins
        SITE_DIR = 'index.html'       // Remplacez par le c hemin de votre site
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'master', url: 'https://github.com/ayoub-yousfi/jenkinsNetlify.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Aucune étape de build nécessaire pour un site statique simple.'
            }
        }

        stage('Deploy to Netlify') {
            steps {
                script {
                    sh """
                    curl -H "Authorization: Bearer $NETLIFY_TOKEN" \
                         -F "file=@$SITE_DIR.zip" \
                         -F "site_id=<votre-site-id>" \
                         https://api.netlify.com/api/v1/sites/<votre-site-id>/deploys
                    """
                }
            }
        }
    }
}