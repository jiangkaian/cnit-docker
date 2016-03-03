FROM       centos
MAINTAINER cnit-jiangkaian <kajiang@chinacnit.com>
RUN     yum install -y wget tar vim-enhanced passwd sudo yum-utils hostname net-tools man
RUN     yum install -y gcc gcc-c++ git
RUN     yum install -y openssh openssh-server httpd
RUN     echo 'root:123456' |chpasswd
RUN     sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN     sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN     sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN     ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN     ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key

EXPOSE 22

COPY sshd.sh /root/sshd.sh
RUN chmod a+x /root/sshd.sh
ENTRYPOINT /root/sshd.sh

#CMD     /usr/sbin/sshd -D
