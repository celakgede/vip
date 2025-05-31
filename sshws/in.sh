#!/bin/bash
# Exit immediately if a command exits with a non-zero status.
set -e

# --- Repository URL for SSHWS files ---
# PENTING: Pastikan URL ini benar dan file-file (ws-dropbear, ws-ovpn.py, ws-stunnel) ada di sini.
# URL ini diambil dari insshws.sh yang Anda berikan.
REPOSC="https://raw.githubusercontent.com/celakgede/vip/main"

# --- Fungsi untuk keluar bersih ---
# Menghapus script ini dan keluar.
junc0() {
    echo -e "\nScript insshws.sh dihentikan. Membersihkan..."
    rm -rf "$0"
    exit 0
}
trap junc0 SIGINT
trap junc0 SIGTERM
# TIDAK trap EXIT di sini agar pembersihan bisa berjalan setelah selesai

echo "--- Memulai instalasi SSH WebSocket services ---"

# --- Instalasi ws-dropbear ---
echo "Mengunduh dan menginstal ws-dropbear..."
wget -q -O /usr/local/bin/ws-dropbear "${REPOSC}/sshws/ws-dropbear" || { echo "ERROR: Gagal mengunduh ws-dropbear. Periksa URL."; exit 1; }
chmod +x /usr/local/bin/ws-dropbear

# Membuat Service ws-dropbear
echo "Membuat service ws-dropbear.service..."
cat > /etc/systemd/system/ws-dropbear.service << END
[Unit]
Description=Python Proxy Decode for Dropbear by RMBLVPN
Documentation=https://t.me/rmblvpn1
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
# Menggunakan python3 untuk kompatibilitas dengan OS modern
ExecStart=/usr/bin/python3 -O /usr/local/bin/ws-dropbear
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Reload, enable, dan mulai service ws-dropbear
echo "Mengelola service ws-dropbear.service..."
systemctl daemon-reload
systemctl enable ws-dropbear.service || { echo "ERROR: Gagal mengaktifkan ws-dropbear.service."; exit 1; }
systemctl start ws-dropbear.service || { echo "ERROR: Gagal memulai ws-dropbear.service."; exit 1; }
systemctl restart ws-dropbear.service # Restart untuk memastikan

# --- Instalasi ws-ovpn ---
echo "Mengunduh dan menginstal ws-ovpn..."
wget -q -O /usr/local/bin/ws-ovpn "${REPOSC}/sshws/ws-ovpn.py" || { echo "ERROR: Gagal mengunduh ws-ovpn.py. Periksa URL."; exit 1; }
chmod +x /usr/local/bin/ws-ovpn

# Membuat Service ws-ovpn
echo "Membuat service ws-ovpn.service..."
cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Decode for OpenVPN by RMBLVPN
Documentation=https://t.me/rmblvpn1
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
# Menggunakan python3 untuk kompatibilitas dengan OS modern
ExecStart=/usr/bin/python3 -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Reload, enable, dan mulai service ws-ovpn
echo "Mengelola service ws-ovpn.service..."
systemctl daemon-reload
systemctl enable ws-ovpn.service || { echo "ERROR: Gagal mengaktifkan ws-ovpn.service."; exit 1; } # Tambahkan .service
systemctl start ws-ovpn.service || { echo "ERROR: Gagal memulai ws-ovpn.service."; exit 1; } # Tambahkan start
systemctl restart ws-ovpn.service # Tambahkan .service dan restart untuk memastikan

# --- Instalasi ws-stunnel ---
echo "Mengunduh dan menginstal ws-stunnel..."
wget -q -O /usr/local/bin/ws-stunnel "${REPOSC}/sshws/ws-stunnel" || { echo "ERROR: Gagal mengunduh ws-stunnel. Periksa URL."; exit 1; }
chmod +x /usr/local/bin/ws-stunnel

# Membuat Service ws-stunnel
echo "Membuat service ws-stunnel.service..."
cat > /etc/systemd/system/ws-stunnel.service << END
[Unit]
Description=Python Proxy Decode for Stunnel by RMBLVPN
Documentation=https://t.me/rmblvpn1
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
# Menggunakan python3 untuk kompatibilitas dengan OS modern
ExecStart=/usr/bin/python3 -O /usr/local/bin/ws-stunnel
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# Reload, enable, dan mulai service ws-stunnel
echo "Mengelola service ws-stunnel.service..."
systemctl daemon-reload
systemctl enable ws-stunnel.service || { echo "ERROR: Gagal mengaktifkan ws-stunnel.service."; exit 1; }
systemctl start ws-stunnel.service || { echo "ERROR: Gagal memulai ws-stunnel.service."; exit 1; }
systemctl restart ws-stunnel.service # Restart untuk memastikan

echo "--- Instalasi SSH WebSocket services selesai ---"

# Hapus script ini setelah selesai
rm -f "$0"
exit 0
