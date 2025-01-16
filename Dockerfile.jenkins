# Base image for Jenkins
FROM jenkins/jenkins:lts

# Switch to root user for package installation (recommended against it for security reasons)
USER root

# Install Docker prerequisites and Docker CLI
RUN apt-get update && apt-get install -y \
    zip \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
  && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
  && add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  && apt-get update && apt-get install -y docker-ce-cli \
  && rm -rf /var/lib/apt/lists/*

# Install docker-compose
RUN curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
  && chmod +x /usr/local/bin/docker-compose

# Switch back to Jenkins user
USER jenkins

# Set Jenkins to run on port 8084
ENV JENKINS_OPTS="--httpPort=8084"
