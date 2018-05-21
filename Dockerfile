FROM centos:7

COPY EGI-trustanchors.repo /etc/yum.repos.d/EGI-trustanchors.repo
RUN yum -y update && \
    yum install epel-release git && \
    yum -y update && \
    yum -y install \
      python-pip \
      ca-certificates \
      ca-policy-egi-core \
      ca-policy-lcg && \
    cd /home && \
    git clone https://github.com/alvarolopez/caso.git -b fix && \
    cd caso && \
    pip install --upgrade pip && \
    pip install . && \
    mkdir -p /etc/caso /var/spool/caso /var/spool/apel/outgoing/openstack
    
