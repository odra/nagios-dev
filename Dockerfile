FROM centos:7

RUN yum update -y
RUN yum groupinstall -y 'Development Tools' && \
yum install -y python-setuptools wget curl && \
easy_install supervisor

RUN wget -qO- https://raw.githubusercontent.com/learning-nagios/nagios-install/master/install.sh | sh

RUN mkdir -p /etc/nagios/cfg && \
(cd /etc/nagios/cfg; mkdir commands timeperiods contacts contactgroups hosts hostgroups services servicegroups) && \
mkdir -p /var/nagios/logs

COPY files /tmp/files
RUN cp /tmp/files/nagios.cfg /etc/nagios/nagios.cfg && \
rm /etc/nagios/resource.cfg && cp /tmp/files/resource.cfg /etc/nagios/resource.cfg && \
mkdir /etc/nagios/defaults && cp /tmp/files/commands.cfg /etc/nagios/defaults/commands.cfg && \
mkdir /opt/nagios/custom-plugi  ns && \
cp /tmp/files/entrypoint.sh /entrypoint.sh && \
mkdir /etc/supervisor && \
cp /tmp/files/supervisord.conf /etc/supervisor/supervisord.conf && \
rm -rf /tmp/files

EXPOSE 80

ENTRYPOINT ["/entrypoint.sh"]
