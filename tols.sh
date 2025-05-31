#!/bin/bash
#
# ==================================================
# Exit immediately if a command exits with a non-zero status.
set -e

clear
# --- Repository URL ---
REPOSC="https://raw.githubusercontent.com/celakgede/vip/main"

# --- Warna untuk output konsol ---
red='\e[1;31m'
green2='\e[1;32m'
yell='\e[1;33m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
W='\e[1;37m'

echo -e " ${W}Menginstal tools dan dependensi sistem!"
echo -e " Proses dimulai...${NC}"

# Go to root directory
cd /root || { red "ERROR: Gagal masuk ke direktori /root. Keluar."; exit 1; }

# Initial system update and cleanup
echo -e "${yell}Melakukan update sistem dan pembersihan awal...${NC}"
apt update -y || { red "ERROR: apt update gagal."; exit 1; }
apt upgrade -y || { red "ERROR: apt upgrade gagal."; exit 1; }
apt dist-upgrade -y || { red "ERROR: apt dist-upgrade gagal."; exit 1; }
apt install -y sudo || { red "ERROR: Instalasi sudo gagal."; exit 1; } # Pastikan sudo terinstal
apt clean all # Modern equivalent of apt-get clean all
apt install -y debconf-utils || { red "ERROR: Instalasi debconf-utils gagal."; exit 1; }
apt-get remove --purge ufw firewalld -y >/dev/null 2>&1 # Hapus firewall yang tidak diperlukan
apt-get remove --purge exim4 -y >/dev/null 2>&1 # Hapus exim4 jika ada
apt autoremove -y >/dev/null 2>&1

# Set debconf selections for iptables-persistent
echo -e "${yell}Mengkonfigurasi iptables-persistent secara non-interaktif...${NC}"
echo iptables-persistent iptables-persistent/autosave_v4 boolean true | debconf-set-selections
echo iptables-persistent iptables-persistent/autosave_v6 boolean true | debconf-set-selections

# Consolidated package installation
echo -e "${yell}Menginstal semua dependensi yang diperlukan...${NC}"
# Packages for general utilities and VPN components
# Removed 'python' (legacy), 'squid3' (handled by ssh-vpn.sh), redundant entries.
# Added 'p7zip-full' and 'nodejs' if not already present.
# Added 'libevent-dev' and 'xl2tpd' for potential VPN needs.
# Added 'chrony' as a modern NTP client alternative.
apt install -y --no-install-recommends software-properties-common || { red "ERROR: Instalasi software-properties-common gagal."; exit 1; }
apt install -y \
    iptables iptables-persistent netfilter-persistent \
    figlet ruby lolcat \
    libxml-parser-perl \
    squid \
    nmap screen curl jq bzip2 gzip coreutils rsyslog iftop htop zip unzip net-tools sed gnupg bc apt-transport-https build-essential dirmngr neofetch screenfetch lsof \
    openssl openvpn easy-rsa fail2ban tmux stunnel4 dropbear socat cron bash-completion ntpdate xz-utils \
    gnupg2 dnsutils lsb-release chrony \
    libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev \
    xl2tpd pptpd \
    apt git speedtest-cli p7zip-full libjpeg-dev zlib1g-dev \
    python3 python3-pip shc \
    nodejs \
    nginx php php-fpm php-cli php-mysql \
    at vnstat \
    || { red "ERROR: Instalasi paket utama gagal. Periksa koneksi atau nama paket."; exit 1; }

# Install pip packages
echo -e "${yell}Menginstal modul Python dengan pip3...${NC}"
pip3 install telethon==1.24.0 || { red "ERROR: Instalasi telethon gagal."; }
pip3 install requests==2.25.1 || { red "ERROR: Instalasi requests gagal."; }

# Initial vnstat setup (if not already handled by ssh-vpn.sh)
# This part is redundant if ssh-vpn.sh also compiles vnstat from source.
# I'll keep it here but add a check to avoid re-compiling if it's already done.
echo -e "${yell}Mengkonfigurasi vnstat (jika belum)...${NC}"
NET=$(ip -o -4 route show to default | awk '{print $5}'); # Re-get NET interface
if ! command -v vnstat >/dev/null 2>&1 || ! vnstat -i "$NET" >/dev/null 2>&1; then
    echo "Vnstat belum terinstal atau terkonfigurasi. Menginstal dari sumber..."
    wget -q "${REPOSC}/vnstat-2.6.tar.gz" || { red "ERROR: Gagal mengunduh vnstat-2.6.tar.gz."; exit 1; }
    tar zxvf vnstat-2.6.tar.gz || { red "ERROR: Gagal mengekstrak vnstat-2.6.tar.gz."; exit 1; }
    cd vnstat-2.6 || { red "ERROR: Gagal masuk ke direktori vnstat-2.6."; exit 1; }
    ./configure --prefix=/usr --sysconfdir=/etc && make && make install || { red "ERROR: Kompilasi vnstat gagal."; exit 1; }
    cd /root || { red "ERROR: Gagal kembali ke /root."; exit 1; }
    vnstat -u -i "$NET" || { red "ERROR: Gagal menginisialisasi database vnstat."; exit 1; }
    sed -i "s/Interface \"\"eth0\"\"/Interface \"\"$NET\"\"/g" /etc/vnstat.conf # Ganti interface
    chown vnstat:vnstat /var/lib/vnstat -R
    systemctl enable vnstat || { red "ERROR: Gagal mengaktifkan vnstat service."; }
    systemctl restart vnstat || { red "ERROR: Gagal merestart vnstat service."; }
    rm -f /root/vnstat-2.6.tar.gz
    rm -rf /root/vnstat-2.6
else
    echo "Vnstat sudah terinstal dan terkonfigurasi. Melewatkan instalasi dari sumber."
fi

# Final cleanup
echo -e "${yell}Melakukan pembersihan akhir...${NC}"
apt autoclean -y >/dev/null 2>&1
apt -y remove --purge unscd >/dev/null 2>&1
apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1

green "Dependencies dan tools berhasil diinstal!"
sleep 1
clear
