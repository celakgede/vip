#!/bin/bash
clear
REPOSC="https://raw.githubusercontent.com/celakgede/vip/main"
red='\e[1;31m'
green2='\e[1;32m'
yell='\e[1;33m'
NC='\e[0m'
junc0() { rm -rf $0; exit 0; }
trap junc0 SIGINT
trap junc0 SIGTERM
trap junc0 EXIT
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
W='\e[1;37m'
green "              Menginstall tools!"
sleep 0.5
green "                   Proses dimulai..."
sleep 0.5

# Mengatur environment variable untuk menghindari prompt interaktif
export DEBIAN_FRONTEND=noninteractive

# Update repository dan sistem
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt install sudo -y

# Instalasi untuk Ubuntu 
sudo apt-get clean all
sudo apt install -y debconf-utils
sudo apt-get remove --purge ufw firewalld -y
sudo apt-get remove --purge exim4 -y
sudo apt-get autoremove -y
sudo apt install -y --no-install-recommends software-properties-common
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | sudo debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | sudo debconf-set-selections
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install iptables iptables-persistent netfilter-persistent figlet ruby libxml-parser-perl squid nmap screen curl jq bzip2 gzip coreutils rsyslog iftop htop zip unzip net-tools sed gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch screenfetch lsof openssl openvpn easy-rsa fail2ban tmux stunnel4 squid3 dropbear socat cron bash-completion ntpdate xz-utils apt-transport-https gnupg2 dnsutils lsb-release chrony libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev xl2tpd pptpd apt git speedtest-cli p7zip-full libjpeg-dev zlib1g-dev python python3 python3-pip shc build-essential nodejs nginx php php-fpm php-cli php-mysql p7zip-full

# remove unnecessary files
sudo apt-get autoclean -y >/dev/null 2>&1
sudo apt-get -y --purge remove unscd >/dev/null 2>&1
sudo apt-get -y --purge remove samba* >/dev/null 2>&1
sudo apt-get -y --purge remove apache2* >/dev/null 2>&1
sudo apt-get -y --purge remove bind9* >/dev/null 2>&1
sudo apt-get -y remove sendmail* >/dev/null 2>&1
sudo apt autoremove -y >/dev/null 2>&1

# finishing
sudo apt install python3 python3-pip git speedtest-cli -y
sudo apt-get install -y p7zip-full
sudo pip3 install telethon==1.24.0
sudo pip3 install requests==2.25.1
sudo apt install at -y
sudo apt-get -y install vnstat
sudo /etc/init.d/vnstat restart
sudo apt-get -y install libsqlite3-dev
wget -q ${REPOSC}/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && sudo make install
cd
sudo vnstat -u -i $NET
sudo sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
sudo chown vnstat:vnstat /var/lib/vnstat -R
sudo systemctl enable vnstat
sudo /etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

green "Dependencies successfully installed..."
sleep 1
clear
rm -f $0
