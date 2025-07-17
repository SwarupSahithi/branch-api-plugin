# Use the official Jenkins LTS image with JDK
FROM jenkins/jenkins:lts

# Switch to root to install Maven
USER root

# Install Maven and clean up apt caches
RUN apt-get update \
    && apt-get install -y maven \
    && rm -rf /var/lib/apt/lists/*

# Set up environment variables so Maven and JDK are accessible
ENV MAVEN_HOME=/usr/share/maven \
    JAVA_HOME=/usr/local/openjdk-17 \
    PATH=$MAVEN_HOME/bin:$JAVA_HOME/bin:$PATH

# Switch back to the Jenkins user (for proper permissions/security)
USER jenkins
