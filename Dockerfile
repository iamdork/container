FROM centos:latest

RUN yum install epel-release -y
RUN yum install openssh-server supervisor -y

RUN mkdir -p /root/.ssh
ADD dork.pub /root/.ssh/authorized_keys
ADD generate_hostkey.sh /opt/generate_hostkey.sh
RUN chmod +x /opt/generate_hostkey.sh
ADD sshd.ini /etc/supervisord.d/sshd.ini

EXPOSE 80

CMD ["/usr/bin/supervisord"]
