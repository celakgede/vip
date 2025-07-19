#!/bin/bash
clear
REPOSC="https://raw.githubusercontent.com/celakgede/vip/main"

# Warna
red='\e[1;31m'
green2='\e[1;32m'
yell='\e[1;33m'
NC='\e[0m'
W='\e[1;37m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }

# Info awal
echo -e " ${W}Menginstall tools !"
echo -e " Proses dimulai...${NC}"

# Update dan persiapan
apt update -y && apt upgrade -y && apt dist-upgrade -y
apt install -y sudo software-properties-common debconf-utils
sudo apt-get clean all

# Hapus firewall default
apt-get remove --purge -y ufw firewalld exim4
apt-get autoremove -y

# Setting iptables-persistent
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections

# Install tool dan dependencies penting
DEBIAN_FRONTEND=noninteractive apt-get install -y \
    iptables iptables-persistent netfilter-persistent figlet ruby \
    libxml-parser-perl squid nmap screen curl jq bzip2 gzip coreutils \
    rsyslog iftop htop zip unzip net-tools sed gnupg gnupg2 \
    bc apt-transport-https build-essential dirmngr neofetch screenfetch \
    lsof openssl openvpn easy-rsa fail2ban tmux stunnel4 \
    squid3 dropbear socat cron bash-completion ntpdate xz-utils \
    dnsutils lsb-release chrony libnss3-dev libnspr4-dev pkg-config \
    libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev \
    libcurl4-nss-dev flex bison make libnss3-tools libevent-dev \
    xl2tpd pptpd apt git p7zip-full libjpeg-dev zlib1g-dev \
    nodejs nginx php php-fpm php-cli php-mysql at vnstat

# Bersihkan sampah dan software tidak dibutuhkan
apt-get -y --purge remove unscd samba* apache2* bind9* sendmail*
apt autoremove -y
apt autoclean -y

# Pastikan python3 dan pip3 terinstal
apt install -y python3 python3-pip

# Install modul python yang dibutuhkan
pip3 install telethon==1.24.0 requests==2.25.1

# Pastikan speedtest-cli & 7zip tersedia
apt install -y speedtest-cli p7zip-full

# Install ulang vnstat 2.6 manual (versi terbaru)
cd /root
wget -q ${REPOSC}/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc && make && make install
cd
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6

# Setup vnstat
NET=$(ip -o -4 route show to default | awk '{print $5}' | head -n1)
vnstat -u -i $NET
sed -i "s/Interface.*/Interface \"$NET\"/" /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart

# Info selesai
green "✅ Semua dependencies berhasil diinstal dan dikonfigurasi."
sleep 1
clear
