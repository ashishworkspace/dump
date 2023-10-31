FROM jenkins/jenkins
USER root
RUN apt update && \
    apt install vim wget sudo -y
RUN sudo apt-get update -y
RUN sudo apt-get install -y apt-transport-https ca-certificates curl && \
    curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
RUN  apt-get update -y && apt-get install -y kubectl
RUN apt update && apt install docker.io -y
RUN usermod -aG docker jenkins
RUN wget -O /usr/local/bin/docker-compose https://github.com/docker/compose/releases/download/v2.23.0/docker-compose-linux-x86_64
RUN chmod +x /usr/local/bin/docker-compose
USER jenkins