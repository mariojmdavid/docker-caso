FROM centos:7

RUN yum -y update && \
    yum install epel-release git wget && \
    yum -y update && \
    yum -y install python-pip && \
    cd /home && \
    git clone https://github.com/alvarolopez/caso.git -b fix && \
    cd caso && \
    pip install --upgrade pip && \
    
