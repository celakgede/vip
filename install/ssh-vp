#!/bin/bash
#
# ==================================================
# Exit immediately if a command exits with a non-zero status.
set -e

# --- Repository URL ---
# PENTING: Pastikan URL ini benar. URL ini diambil dari ssh-vpn.sh yang Anda berikan.
REPOSC="https://raw.githubusercontent.com/celakgede/vip/main"

# --- Fungsi untuk keluar bersih ---
junc0() {
    echo -e "\nScript ssh-vpn.sh dihentikan. Membersihkan..."
    rm -rf "$0" # Hapus script ini
    exit 0
}
trap junc0 SIGINT
trap junc0 SIGTERM
# TIDAK trap EXIT di sini agar pembersihan bisa berjalan setelah selesai

echo "--- Memulai instalasi SSH & VPN konfigurasi ---"

# etc
echo "Mengupdate dan menginstal paket dasar..."
apt update -y || { echo "ERROR: apt update gagal."; exit 1; }
apt dist-upgrade -y || { echo "ERROR: apt dist-upgrade gagal."; exit 1; }
apt install -y netfilter-persistent || { echo "ERROR: Instalasi netfilter-persistent gagal."; exit 1; }
apt-get remove --purge ufw firewalld -y >/dev/null 2>&1 # Hapus firewall yang tidak diperlukan
apt install -y screen curl jq bzip2 gzip vnstat coreutils rsyslog iftop zip unzip git apt-transport-https build-essential figlet ruby -y || { echo "ERROR: Instalasi paket dasar gagal."; exit 1; }
gem install lolcat || { echo "ERROR: Instalasi lolcat gagal."; }

# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o -4 route show to default | awk '{print $5}'); # Menggunakan -4 untuk IPv4 saja

#detail nama perusahaan (untuk sertifikat SSL)
country=ID
state=Indonesia
locality=Jakarta
organization=RMBLVPN
organizationalunit=IT
commonname=$MYIP # Bisa diganti dengan domain jika sudah punya
email=admin@rmblvpn.xyz # Ganti dengan email Anda

# simple password minimal
echo "Mengkonfigurasi kebijakan password minimal..."
wget -q -O /etc/pam.d/common-password "${REPOSC}/install/password" || { echo "ERROR: Gagal mengunduh common-password."; exit 1; }
chmod +x /etc/pam.d/common-password

# go to root
cd /root || { echo "ERROR: Gagal masuk ke direktori /root."; exit 1; }

# Edit file /etc/systemd/system/rc-local.service
echo "Mengkonfigurasi rc.local service..."
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local || { echo "ERROR: Gagal mengaktifkan rc-local service."; }
systemctl start rc-local.service || { echo "ERROR: Gagal memulai rc-local service."; }

# update (ulang untuk memastikan semua dependensi terinstal)
echo "Melakukan update ulang dan pembersihan paket..."
apt update -y || { echo "ERROR: apt update kedua gagal."; exit 1; }
apt upgrade -y || { echo "ERROR: apt upgrade kedua gagal."; exit 1; }
apt dist-upgrade -y || { echo "ERROR: apt dist-upgrade kedua gagal."; exit 1; }
apt-get remove --purge exim4 -y >/dev/null 2>&1 # Hapus exim4 jika ada

# // install utility tools
echo "Menginstal utilitas tambahan..."
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git lsof || { echo "ERROR: Instalasi utilitas tambahan gagal."; exit 1; }

# set time GMT +7
echo "Mengatur zona waktu ke Asia/Jakarta..."
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
echo "Mengkonfigurasi locale SSH..."
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install_ssl function (dijalankan oleh ins-xray.sh)
# Fungsi ini tidak perlu dieksekusi di sini, karena sudah ada di ins-xray.sh.
# install_ssl(){ ... }

# install webserver
echo "Menginstal Nginx dan PHP..."
apt -y install nginx php php-fpm php-cli php-mysql libxml-parser-perl || { echo "ERROR: Instalasi Nginx/PHP gagal."; exit 1; }
rm -f /etc/nginx/sites-enabled/default
rm -f /etc/nginx/sites-available/default
wget -q -O /etc/nginx/nginx.conf "${REPOSC}/install/nginx.conf" || { echo "ERROR: Gagal mengunduh nginx.conf."; exit 1; }
wget -q -O /etc/nginx/conf.d/vps.conf "${REPOSC}/install/vps.conf" || { echo "ERROR: Gagal mengunduh vps.conf."; exit 1; }

# Deteksi versi PHP FPM dan sesuaikan path
PHP_FPM_VERSION=$(php -r "echo PHP_VERSION_ID;" | cut -c1-2) # Contoh: 74, 81, 82
PHP_FPM_CONF="/etc/php/${PHP_FPM_VERSION}/fpm/pool.d/www.conf"

if [ -f "$PHP_FPM_CONF" ]; then
    sed -i 's/listen = \/run\/php\/php-fpm.sock/listen = 127.0.0.1:9000/g' "$PHP_FPM_CONF"
    sed -i 's/listen = \/var\/run\/php\/php.*-fpm.sock/listen = 127.0.0.1:9000/g' "$PHP_FPM_CONF" # Untuk handle versi lain
else
    echo "Peringatan: File konfigurasi PHP-FPM tidak ditemukan di $PHP_FPM_CONF. Mungkin perlu penyesuaian manual."
fi

useradd -m vps;
mkdir -p /home/vps/public_html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
chown -R www-data:www-data /home/vps/public_html
chmod -R g+rw /home/vps/public_html
cd /home/vps/public_html || { echo "ERROR: Gagal masuk ke /home/vps/public_html."; exit 1; }
wget -q -O /home/vps/public_html/index.html "${REPOSC}/install/index.html1" || { echo "ERROR: Gagal mengunduh index.html1."; exit 1; }
/etc/init.d/nginx restart || { echo "ERROR: Gagal merestart Nginx."; exit 1; }

# install badvpn
echo "Menginstal badvpn..."
cd /root || { echo "ERROR: Gagal masuk ke /root."; exit 1; }
wget -q -O /usr/sbin/badvpn "${REPOSC}/install/badvpn" || { echo "ERROR: Gagal mengunduh badvpn binary."; exit 1; }
chmod +x /usr/sbin/badvpn

wget -q -O /etc/systemd/system/badvpn1.service "${REPOSC}/install/badvpn1.service" || { echo "ERROR: Gagal mengunduh badvpn1.service."; exit 1; }
wget -q -O /etc/systemd/system/badvpn2.service "${REPOSC}/install/badvpn2.service" || { echo "ERROR: Gagal mengunduh badvpn2.service."; exit 1; }
wget -q -O /etc/systemd/system/badvpn3.service "${REPOSC}/install/badvpn3.service" || { echo "ERROR: Gagal mengunduh badvpn3.service."; exit 1; }

systemctl daemon-reload
systemctl enable badvpn1.service badvpn2.service badvpn3.service >/dev/null 2>&1
systemctl restart badvpn1.service badvpn2.service badvpn3.service >/dev/null 2>&1
echo "Badvpn services diaktifkan dan direstart."

# setting port ssh
echo "Mengkonfigurasi port SSH..."
cd /etc/ssh || { echo "ERROR: Gagal masuk ke /etc/ssh."; exit 1; }
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' sshd_config
# Tambahkan port di bawah Port 22 jika belum ada
grep -q "Port 22" sshd_config || sed -i '/^#Port 22/a Port 22' sshd_config
sed -i '/Port 22/a Port 500' sshd_config
sed -i '/Port 22/a Port 40000' sshd_config
sed -i '/Port 22/a Port 51443' sshd_config
sed -i '/Port 22/a Port 58080' sshd_config
sed -i '/Port 22/a Port 200' sshd_config
/etc/init.d/ssh restart || { echo "ERROR: Gagal merestart SSH."; exit 1; }

echo "=== Install Dropbear ==="
# install dropbear
echo "Menginstal Dropbear..."
apt -y install dropbear || { echo "ERROR: Instalasi Dropbear gagal."; exit 1; }
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
# Memastikan DROPBEAR_EXTRA_ARGS hanya ada satu kali dan tidak duplikat
if ! grep -q 'DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69"' /etc/default/dropbear; then
    sed -i 's/DROPBEAR_EXTRA_ARGS="/DROPBEAR_EXTRA_ARGS="-p 50000 -p 109 -p 110 -p 69 /g' /etc/default/dropbear
fi
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart || { echo "ERROR: Gagal merestart SSH."; exit 1; }
/etc/init.d/dropbear restart || { echo "ERROR: Gagal merestart Dropbear."; exit 1; }

echo "=== Install Squid ==="
# Install Squid
echo "Mencoba menginstal Squid..."
# Deteksi distribusi untuk instalasi Squid yang tepat
if grep -qs "PRETTY_NAME=\"Debian GNU/Linux 11" /etc/os-release; then
    apt -y install squid || { echo "ERROR: Instalasi Squid (Debian 11) gagal."; exit 1; }
elif grep -qs "PRETTY_NAME=\"Debian GNU/Linux 12" /etc/os-release; then
    apt -y install squid || { echo "ERROR: Instalasi Squid (Debian 12) gagal."; exit 1; }
elif grep -qs "DISTRIB_RELEASE=20.04" /etc/lsb-release || grep -qs "VERSION_ID=\"20.04\"" /etc/os-release; then
    apt -y install squid3 || { echo "ERROR: Instalasi Squid (Ubuntu 20.04) gagal."; exit 1; }
elif grep -qs "DISTRIB_RELEASE=22.04" /etc/lsb-release || grep -qs "VERSION_ID=\"22.04\"" /etc/os-release; then
    apt -y install squid || { echo "ERROR: Instalasi Squid (Ubuntu 22.04) gagal."; exit 1; }
elif grep -qs "DISTRIB_RELEASE=24.04" /etc/lsb-release || grep -qs "VERSION_ID=\"24.04\"" /etc/os-release; then
    apt -y install squid || { echo "ERROR: Instalasi Squid (Ubuntu 24.04) gagal."; exit 1; }
else
    echo "Peringatan: Distribusi tidak dikenali atau tidak didukung untuk instalasi Squid otomatis. Mencoba paket 'squid'."
    apt -y install squid || { echo "ERROR: Instalasi Squid generik gagal."; exit 1; }
fi

wget -q -O /etc/squid/squid.conf "${REPOSC}/install/squid3.conf" || { echo "ERROR: Gagal mengunduh squid.conf."; exit 1; }
sed -i "$MYIP2" /etc/squid/squid.conf # Ganti placeholder IP
systemctl restart squid || { echo "ERROR: Gagal merestart Squid."; exit 1; }
systemctl enable squid || { echo "ERROR: Gagal mengaktifkan Squid."; exit 1; }
echo "Squid berhasil diinstal dan dikonfigurasi."


# setting vnstat
echo "Mengkonfigurasi vnstat..."
apt -y install vnstat || { echo "ERROR: Instalasi vnstat gagal."; exit 1; }
/etc/init.d/vnstat restart || { echo "ERROR: Gagal merestart vnstat service."; }

# Menginstal vnstat versi terbaru dari source
echo "Menginstal vnstat versi 2.6 dari sumber..."
cd /root || { echo "ERROR: Gagal masuk ke /root."; exit 1; }
wget -q https://humdi.net/vnstat/vnstat-2.6.tar.gz || { echo "ERROR: Gagal mengunduh vnstat source."; exit 1; }
tar zxvf vnstat-2.6.tar.gz || { echo "ERROR: Gagal mengekstrak vnstat source."; exit 1; }
cd vnstat-2.6 || { echo "ERROR: Gagal masuk ke vnstat-2.6 directory."; exit 1; }
./configure --prefix=/usr --sysconfdir=/etc && make && make install || { echo "ERROR: Kompilasi vnstat gagal."; exit 1; }
cd /root || { echo "ERROR: Gagal kembali ke /root."; exit 1; }
vnstat -u -i "$NET" || { echo "ERROR: Gagal menginisialisasi database vnstat."; exit 1; }
sed -i "s/Interface \"\"eth0\"\"/Interface \"\"$NET\"\"/g" /etc/vnstat.conf # Ganti interface
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat || { echo "ERROR: Gagal mengaktifkan vnstat service."; }
/etc/init.d/vnstat restart || { echo "ERROR: Gagal merestart vnstat service."; }
rm -f /root/vnstat-2.6.tar.gz
rm -rf /root/vnstat-2.6
echo "Vnstat berhasil diinstal dan dikonfigurasi."

cd /root || { echo "ERROR: Gagal masuk ke /root."; exit 1; }
# install stunnel
echo "Menginstal Stunnel..."
apt install stunnel4 -y || { echo "ERROR: Instalasi Stunnel4 gagal."; exit 1; }
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[dropbear]
accept = 8880
connect = 127.0.0.1:22

[dropbear-alt] # Nama unik jika ada dua bagian dropbear
accept = 8443
connect = 127.0.0.1:109

[ws-stunnel] # Pastikan port ini tidak bentrok dengan SSHWS yang lain
accept = 444
connect = 700

[openvpn]
accept = 990
connect = 127.0.0.1:1194

END

# make a certificate
echo "Membuat sertifikat SSL untuk Stunnel..."
openssl genrsa -out key.pem 2048 || { echo "ERROR: Gagal membuat key.pem."; exit 1; }
# Pastikan format subj benar. Contoh: /C=US/ST=CA/L=SF/O=MyOrg/OU=MyUnit/CN=example.com/emailAddress=me@example.com
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 -subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email" || { echo "ERROR: Gagal membuat cert.pem."; exit 1; }
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem || { echo "ERROR: Gagal menggabungkan sertifikat."; exit 1; }

# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
/etc/init.d/stunnel4 restart || { echo "ERROR: Gagal merestart Stunnel4."; exit 1; }
echo "Stunnel berhasil diinstal dan dikonfigurasi."

#OpenVPN
echo "Menginstal OpenVPN..."
wget -q -O /root/vpn.sh "${REPOSC}/install/vpn.sh" || { echo "ERROR: Gagal mengunduh vpn.sh."; exit 1; }
chmod +x /root/vpn.sh
/root/vpn.sh || { echo "ERROR: Gagal menjalankan vpn.sh."; exit 1; }
rm -f /root/vpn.sh

# memory swap 1gb
echo "Mengkonfigurasi swap file 1GB..."
cd /root || { echo "ERROR: Gagal masuk ke /root."; exit 1; }
dd if=/dev/zero of=/swapfile bs=1024 count=1048576 || { echo "ERROR: Gagal membuat swapfile."; exit 1; }
mkswap /swapfile || { echo "ERROR: Gagal menginisialisasi swapfile."; exit 1; }
chown root:root /swapfile
chmod 0600 /swapfile
swapon /swapfile
grep -q "/swapfile" /etc/fstab || echo '/swapfile none swap sw 0 0' >> /etc/fstab # Hanya tambahkan jika belum ada
echo "Swap file 1GB berhasil dikonfigurasi."

# install fail2ban
echo "Menginstal Fail2Ban..."
apt -y install fail2ban || { echo "ERROR: Instalasi Fail2Ban gagal."; exit 1; }
echo "Fail2Ban berhasil diinstal."

# Instal DDOS Flate
echo "Menginstal DOS-Deflate..."
if [ -d '/usr/local/ddos' ]; then
	echo "DOS-Deflate sudah terinstal. Melewatkan instalasi."
else
	mkdir -p /usr/local/ddos || { echo "ERROR: Gagal membuat direktori /usr/local/ddos."; exit 1; }
fi
echo -n 'Downloading source files...'
wget -q -O /usr/local/ddos/ddos.conf http://www.inetbase.com/scripts/ddos/ddos.conf || { echo "ERROR: Gagal mengunduh ddos.conf."; exit 1; }
echo -n '.'
wget -q -O /usr/local/ddos/LICENSE http://www.inetbase.com/scripts/ddos/LICENSE || { echo "ERROR: Gagal mengunduh LICENSE."; exit 1; }
echo -n '.'
wget -q -O /usr/local/ddos/ignore.ip.list http://www.inetbase.com/scripts/ddos/ignore.ip.list || { echo "ERROR: Gagal mengunduh ignore.ip.list."; exit 1; }
echo -n '.'
wget -q -O /usr/local/ddos/ddos.sh http://www.inetbase.com/scripts/ddos/ddos.sh || { echo "ERROR: Gagal mengunduh ddos.sh."; exit 1; }
chmod 0755 /usr/local/ddos/ddos.sh
cp -s /usr/local/ddos/ddos.sh /usr/local/sbin/ddos
echo '...done'
echo -n 'Creating cron to run script every minute.....(Default setting)'
/usr/local/ddos/ddos.sh --cron > /dev/null 2>&1
echo '.....done'
echo 'Installation of DOS-Deflate has completed.'
echo 'Config file is at /usr/local/ddos/ddos.conf'

#install bbr dan optimasi kernel
echo "Menginstal BBR dan optimasi kernel..."
wget -q -O /root/bbr.sh "${REPOSC}/install/bbr.sh" || { echo "ERROR: Gagal mengunduh bbr.sh."; exit 1; }
chmod +x /root/bbr.sh
/root/bbr.sh || { echo "ERROR: Gagal menjalankan bbr.sh."; exit 1; }
rm -f /root/bbr.sh

# blokir torrent
echo "Mengkonfigurasi blokir torrent dengan Iptables..."
iptables -A FORWARD -m string --string "get_peers" --algo bm -j DROP
iptables -A FORWARD -m string --string "announce_peer" --algo bm -j DROP
iptables -A FORWARD -m string --string "find_node" --algo bm -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "BitTorrent protocol" -j DROP
iptables -A FORWARD -m string --algo bm --string "peer_id=" -j DROP
iptables -A FORWARD -m string --algo bm --string ".torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce.php?passkey=" -j DROP
iptables -A FORWARD -m string --algo bm --string "torrent" -j DROP
iptables -A FORWARD -m string --algo bm --string "announce" -j DROP
iptables -A FORWARD -m string --algo bm --string "info_hash" -j DROP
iptables-save > /etc/iptables.up.rules
netfilter-persistent save || { echo "ERROR: Gagal menyimpan aturan netfilter."; exit 1; }
netfilter-persistent reload || { echo "ERROR: Gagal memuat ulang aturan netfilter."; exit 1; }
echo "Blokir torrent berhasil dikonfigurasi."

echo '#!/bin/bash' > /usr/local/bin/reboot_otomatis
echo 'tanggal=$(date +"%m-%d-%Y")' >> /usr/local/bin/reboot_otomatis
echo 'waktu=$(date +"%T")' >> /usr/local/bin/reboot_otomatis
echo 'echo "Server rebooted on $tanggal $waktu." >> /etc/log-reboot.txt' >> /usr/local/bin/reboot_otomatis
echo '/sbin/shutdown -r now' >> /usr/local/bin/reboot_otomatis
chmod +x /usr/local/bin/reboot_otomatis

# download script
cd /usr/bin || { echo "ERROR: Gagal masuk ke /usr/bin."; exit 1; }
wget -q -O issue "${REPOSC}/install/issue.net" || { echo "ERROR: Gagal mengunduh issue.net."; exit 1; }
wget -q -O speedtest "${REPOSC}/install/speedtest_cli.py" || { echo "ERROR: Gagal mengunduh speedtest_cli.py."; exit 1; }
chmod +x issue
chmod +x speedtest
cd /root || { echo "ERROR: Gagal masuk ke /root."; exit 1; }

# Buat file crontab untuk berbagai task otomatis
echo "Mengkonfigurasi Crontab untuk berbagai task otomatis..."
CRON_DIR="/etc/cron.d"
mkdir -p "$CRON_DIR" # Pastikan direktori ada

cat > "$CRON_DIR/reboot_otomatis" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 3 * * * root /usr/local/bin/reboot_otomatis
EOF

cat > "$CRON_DIR/xp" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 0 * * * root /usr/local/sbin/xp
0 0 * * * root /usr/local/sbin/sixtydays
EOF

cat > "$CRON_DIR/deltrialssh" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * * * * root /usr/local/sbin/deltrialssh
EOF

cat > "$CRON_DIR/deltrialv2ray" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * * * * root /usr/local/sbin/deltrialv2ray
EOF

cat > "$CRON_DIR/onoff" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * * * * root /usr/local/sbin/onoff
EOF

cat > "$CRON_DIR/tendang" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * * * * root /usr/local/sbin/tendang
EOF

cat > "$CRON_DIR/xraylimit" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * * * * root /usr/local/sbin/xraylimit
EOF

cat > "$CRON_DIR/cleaner" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/4 * * * * root /usr/local/sbin/cleaner
EOF

cat > "$CRON_DIR/cooling" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2-59/5 * * * * root /usr/local/sbin/checking
EOF

cat > "$CRON_DIR/bandwidth" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* * * * * root /usr/local/sbin/bantwidth
EOF

cat > "$CRON_DIR/autobackup" << EOF
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
10 */4 * * * root /usr/local/sbin/bottelegram
EOF

service cron restart >/dev/null 2>&1
service cron reload >/dev/null 2>&1
service cron start >/dev/null 2>&1
echo "Konfigurasi Crontab selesai."

# remove unnecessary files
echo "Melakukan pembersihan paket dan file tidak perlu..."
apt autoclean -y >/dev/null 2>&1
apt -y remove --purge unscd >/dev/null 2>&1
apt-get -y --purge remove samba* >/dev/null 2>&1
apt-get -y --purge remove apache2* >/dev/null 2>&1
apt-get -y --purge remove bind9* >/dev/null 2>&1
apt-get -y remove sendmail* >/dev/null 2>&1
apt autoremove -y >/dev/null 2>&1

# finishing
cd /root || { echo "ERROR: Gagal masuk ke /root."; exit 1; }
chown -R www-data:www-data /home/vps/public_html

rm -f /root/key.pem
rm -f /root/cert.pem
rm -f /root/ssh-vpn.sh
rm -f /root/bbr.sh
rm -rf /etc/apache2 # Hapus direktori Apache2 jika ada

clear
echo "--- Instalasi SSH & VPN konfigurasi selesai ---"
rm -f "$0"
exit 0
