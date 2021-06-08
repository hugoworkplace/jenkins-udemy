FROM centos
  
RUN yum -y install openssh-server

#RUN useradd remote_user && \
#    echo "1234" | passwd remote_user --stdin && \
#    mkdir /home/remote_user/.ssh && \
#    chmod 700 /home/remote_user/.ssh
#
RUN useradd remote_user && \
    echo "remote_user:1234" | chpasswd && \
    mkdir /home/remote_user/.ssh && \
    chmod 700 /home/remote_user/.ssh

#RUN /usr/sbin/sshd-keygen


COPY remote-key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
    chmod 600 /home/remote_user/.ssh/authorized_keys

RUN ssh-keygen -A
RUN rm -rf /run/nologin
RUN yum install -y mysql
RUN dnf install -y unzip python3 && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install

CMD /usr/sbin/sshd -D

