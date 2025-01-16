# Deploying a Simple Static Website on Netlify with Jenkins Pipeline and Docker

This guide outlines the process of deploying a static website on Netlify using Jenkins to automate the pipeline, with Docker as the container management tool. It provides a complete walkthrough, from creating the required files to setting up the pipeline.

---

## Step 1: Create the Required Files

1. Create an HTML file (`index.html`) with a simple message like "Hello, World!".
2. Create a `docker-compose.yml` file to manage Docker containers.
3. Create a `Dockerfile.jenkins` to define the Jenkins container environment.
4. Create a `Jenkinsfile` to define the pipeline stages for automation.
5. Initialize a new Git repository, commit all files, and push them to GitHub.

---

## Step 2: Docker Configuration

1. Open Docker Desktop.
2. Build the Docker containers using `docker-compose build`.
3. Run the Docker containers using `docker-compose up`.
4. Verify Jenkins is running at `http://localhost:8084`.

---

## Step 3: Jenkins Configuration

1. Access Jenkins in your browser at `http://localhost:8084`.
2. Complete the initial setup and install recommended plugins.
3. Add GitHub credentials in **Manage Jenkins > Credentials > (global) > Add Credentials**:
   - Select **Username with password**.
   - Provide your GitHub username and personal access token.
4. Create a new pipeline in Jenkins:
   - Click **New Item**.
   - Enter a pipeline name (e.g., "StaticSitePipeline").
   - Select **Pipeline** as the type.
   - Configure the pipeline to use **Pipeline script from SCM** with your GitHub repository URL and credentials.

---

## Step 4: Netlify Configuration

1. Log in to Netlify and generate a personal access token under **User Settings > Applications > Personal Access Tokens**.
2. Add the Netlify token to Jenkins as a secret text credential in **Manage Jenkins > Credentials > (global) > Add Credentials**.
3. Configure the Jenkins pipeline to use the Netlify token for deployment.
4. Run the pipeline in Jenkins to deploy the static site.

---

## Step 5: Continuous Updates

1. Make any modifications to the `index.html` file.
2. Commit and push the changes to GitHub.
3. Rerun the Jenkins pipeline to update the deployment on Netlify.

---

## Summary
By following these steps, you can:
1. Create and manage a static website.
2. Use Docker to containerize Jenkins for automation.
3. Automate the deployment process with a Jenkins pipeline.
4. Host the website on Netlify, ensuring seamless updates with each pipeline run.

Enjoy your streamlined deployment process!

![Alt Text](C:\Users\a.yousfi\Desktop\ayoubbot\jenkinsNetlify\img.gif)