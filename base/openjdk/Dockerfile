FROM centos:6.9

MAINTAINER Aaditya <xyz@hadoop.com>

USER root

ENV TERM=xterm

RUN yum -y update; \
    yum -y install java-1.8.0-openjdk java-1.8.0-openjdk-devel epel-release initscripts openssh-server openssh-clients sudo tar unzip vim wget curl gpg krb5-libs krb5-server krb5-auth-dialog krb5-workstation net-tools openldap-clients nano jq nc telnet lsof python27 scl-utils centos-release-scl; \
    yum -y install supervisor; \
    scl enable python27 bash; \
    chkconfig sshd on; \
    yum clean all; \
    rm -rf /tmp/*; \
    echo 'export PYTHONPATH="/usr/lib/python2.7/site-packages/":$PYTHONPATH' >> /etc/profile; \
    echo "root:root" | chpasswd; \
    service sshd restart; \
    wget https://chriswhocodes.com/downloads/openjfx-8-sdk-overlay-osx-x64.zip; \
    mkdir openjfx; \
    mv openjfx-8-sdk-overlay-osx-x64.zip openjfx; \
    cd openjfx; \
    unzip openjfx-8-sdk-overlay-osx-x64.zip; \
    cp -R -u jre/* /usr/lib/jvm/java/jre/; \
    rm -rf /openjfx;


ENV PYTHONPATH="/usr/lib/python2.7/site-packages/":$PYTHONPATH
