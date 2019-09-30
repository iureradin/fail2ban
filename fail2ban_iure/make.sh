#!/bin/bash


########   Regras para o firewall  #########


iptables -N FILTRO_IURE
iptables -F FILTRO_IURE
iptables -D INPUT -j FILTRO_IURE
iptables -I INPUT -j FILTRO_IURE

iptables -A FILTRO_IURE  -p tcp --dport 22 -j RETURN 
iptables -A FILTRO_IURE  -p tcp --dport 443 -j RETURN 
iptables -A FILTRO_IURE  -p tcp --dport 80 -j RETURN 
iptables -A FILTRO_IURE  -p tcp --dport 53 -j RETURN 
iptables -A FILTRO_IURE  -p udp --dport 53 -j RETURN 
iptables -A FILTRO_IURE  -p udp --dport 514 -j RETURN 
iptables -A FILTRO_IURE  -p tcp --dport 25 -j RETURN 
iptables -A FILTRO_IURE  -m state --state NEW -j LOG --log-prefix "SUSPEITO "

iptables -A FILTRO_IURE -j RETURN

docker build -t fail2ban .

docker run -dt -v /var/log:/var/log -v /etc/localtime:/etc/localtime --name fail2ban fail2ban
