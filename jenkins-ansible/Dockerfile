FROM jenkins/jenkins

USER root

RUN echo  "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 && \
	apt update && \
	apt install -y ansible

RUN apt-get install -y wget

RUN wget https://www-us.apache.org/dist/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp

RUN tar xf /tmp/apache-maven-*.tar.gz -C /opt

RUN ln -s /opt/apache-maven-3.6.3 /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin && \
    chown -R jenkins:jenkins /opt/maven 

ENV MAVEN_HOME /opt/maven


#RUN export JAVA_HOME=/usr/lib/jvm/default-java && \
#    export M2_HOME=/opt/maven && \
#    export MAVEN_HOME=/opt/maven && \
#    export PATH=${M2_HOME}/bin:${PATH} && \
#    rm -f /tmp/apache* && \
#    chown -R jenkins:jenkins /opt/maven


RUN apt-get clean



USER jenkins
