#!/bin/bash
clear
red='\e[1;31m'
green2='\e[1;32m'
yell='\e[1;33m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }

echo "           Tools install...!"
echo "                  Progress..."
sleep 0.5

# Update dan upgrade sistem
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt install sudo -y
sudo apt-get clean all
apt install -y debconf-utils
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y
apt-get autoremove -y
apt install -y --no-install-recommends software-properties-common

# Konfigurasi iptables
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections

# Install paket penting
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install iptables iptables-persistent netfilter-persistent figlet ruby libxml-parser-perl squid nmap screen curl jq bzip2 gzip coreutils rsyslog iftop htop zip unzip net-tools sed gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch screenfetch lsof openssl openvpn easy-rsa fail2ban tmux stunnel4 squid3 dropbear socat cron bash-completion ntpdate xz-utils apt-transport-https gnupg2 dnsutils lsb-release chrony libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev xl2tpd pptpd apt git speedtest-cli p7zip-full libjpeg-dev zlib1g-dev python3 python3-pip shc build-essential nodejs nginx php php-fpm php-cli php-mysql p7zip-full

# Bersihkan sistem dari paket yang tidak digunakan
sudo apt-get autoclean -y >/dev/null 2>&1
sudo apt-get -y --purge remove unscd samba* apache2* bind9* sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1

# Install Python dan Telethon
apt install python3 python3-pip -y
pip3 install --upgrade pip
pip3 install telethon==1.24.0 requests==2.25.1

# Install vnStat
sudo apt-get -y install vnstat
/etc/init.d/vnstat restart
sudo apt-get -y install libsqlite3-dev

# Install dan konfigurasi vnStat 2.6
wget https://raw.githubusercontent.com/celakgede/vip/main/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart

# Bersihkan file instalasi vnStat
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

yellow "Dependencies successfully installed..."
sleep 1
clear
