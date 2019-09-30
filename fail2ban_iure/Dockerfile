FROM centos

RUN yum -y update 
RUN yum -y install epel-release &&\
	yum -y install supervisor.noarch && \
	yum -y install fail2ban-server nano


WORKDIR /etc/fail2ban
RUN mkdir log
RUN sed -i 's/\/var\/log\/fail2ban.log/\/etc\/fail2ban\/log\/fail2ban.log/g'  fail2ban.conf

COPY ./filter.d/ipt.conf /etc/fail2ban/filter.d/ipt.conf
COPY ./jail/ipt.conf /etc/fail2ban/jail.d/ipt.conf
COPY ./jail.local /etc/fail2ban/jail.local
COPY ./supervisord.conf /etc/supervisord.conf


RUN ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]


