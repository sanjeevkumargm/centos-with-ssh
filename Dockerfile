FROM centos:centos7
MAINTAINER Sanjeev Kumar <sanjeevkumargm1512@gmail.com>
LABEL version="1.0" location="India" type="centos7-with-ssh" 
RUN yum update -y
RUN yum install openssh* -y 
RUN yum install vim sudo epel-release initscripts -y
RUN yum clean all
RUN service sshd restart
EXPOSE 22
VOLUME ["/data"]
COPY . /data
RUN chmod +x /data/red.sh
WORKDIR /root
USER root
ENTRYPOINT //data/red.sh && /bin/bash
