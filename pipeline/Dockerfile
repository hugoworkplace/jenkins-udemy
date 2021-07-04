FROM jenkins/jenkins

USER root

#check your docker group id on the host and change it
ARG DOCKER_GID=998

RUN groupadd -g ${DOCKER_GID} docker && usermod -aG docker jenkins

RUN echo  "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
	apt update && \
	apt install -y ansible

RUN apt-get update && \
    apt-get install -y  \
    apt-transport-https  \
    ca-certificates  \
    curl \
    gnupg \
    lsb-release

RUN  curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
     echo  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
     $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt-get update &&  apt-get install -y docker-ce docker-ce-cli containerd.io

RUN curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose 

RUN apt-get clean



USER jenkins
