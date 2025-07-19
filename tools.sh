#!/bin/bash
clear
REPOSC="https://humdi.net/vnstat"
red='\e[1;31m'
green2='\e[1;32m'
yell='\e[1;33m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
W='\e[1;37m'

echo -e " ${W}Menginstall tools !"
echo -e " Proses dimulai...${NC}"

# Update sistem
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt install sudo -y
sudo apt-get clean all
apt install -y debconf-utils

# Hapus service default
apt-get remove --purge -y ufw firewalld exim4
apt-get autoremove -y

# Tambahan utilitas penting
apt install -y --no-install-recommends software-properties-common

# Autoconfirm iptables-persistent
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections

# Install paket penting
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install \
    iptables iptables-persistent netfilter-persistent figlet ruby \
    libxml-parser-perl squid nmap screen curl jq bzip2 gzip coreutils rsyslog \
    iftop htop zip unzip net-tools sed gnupg bc build-essential \
    dirmngr neofetch screenfetch lsof openssl openvpn easy-rsa fail2ban \
    tmux stunnel4 dropbear socat cron bash-completion ntpdate xz-utils \
    gnupg2 dnsutils lsb-release chrony libnss3-dev libnspr4-dev pkg-config \
    libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev \
    flex bison make libnss3-tools libevent-dev xl2tpd pptpd git speedtest-cli \
    p7zip-full libjpeg-dev zlib1g-dev python3 python3-pip shc nodejs nginx \
    php php-fpm php-cli php-mysql at libsqlite3-dev

# Hapus service tidak diperlukan
sudo apt-get -y --purge remove unscd samba* apache2* bind9* sendmail*
apt autoremove -y >/dev/null 2>&1

# Reinstall python3 + pip (pastikan)
apt install -y python3 python3-pip

# Install Python package
pip3 install --upgrade pip
pip3 install telethon==1.24.0
pip3 install requests==2.25.1

# Cek interface jaringan aktif
NET=$(ip route | grep default | awk '{print $5}' | head -n1)
[[ -z "$NET" ]] && NET="eth0"

# Download vnstat resmi terbaru
cd /root
VN_URL=$(curl -s https://humdi.net/vnstat/ | grep -oP 'https://humdi\.net/vnstat/vnstat-\K[0-9.]+(?=\.tar\.gz)' | sort -V | tail -n1)
wget -q https://humdi.net/vnstat/vnstat-${VN_URL}.tar.gz
tar -xzf vnstat-${VN_URL}.tar.gz
cd vnstat-${VN_URL}
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
rm -f vnstat-${VN_URL}.tar.gz
rm -rf vnstat-${VN_URL}

# Setup interface vnstat
vnstat -u -i $NET
sed -i "s|^Interface .*|Interface \"$NET\"|g" /etc/vnstat.conf 2>/dev/null
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
systemctl restart vnstat

green "Dependencies + vnStat ${VN_URL} berhasil diinstal!"
sleep 1
clear
