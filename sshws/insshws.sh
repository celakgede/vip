#!/bin/bash
REPOSC="https://raw.githubusercontent.com/celakgede/vip/main"

junc0() { rm -rf $0; exit 0; }
trap junc0 SIGINT
trap junc0 SIGTERM
trap junc0 EXIT

# --- Pastikan python3 tersedia
if ! command -v python3 >/dev/null 2>&1; then
    echo "Python3 tidak ditemukan. Mohon install dulu."
    exit 1
fi

PYTHON_PATH=$(command -v python3)

# --- Install ws-dropbear
wget -q -O /usr/local/bin/ws-dropbear ${REPOSC}/sshws/ws-dropbear
chmod +x /usr/local/bin/ws-dropbear

cat > /etc/systemd/system/ws-dropbear.service << END
[Unit]
Description=Python Proxy Decode by RMBLVPN (Dropbear)
Documentation=https://t.me/rmblvpn1
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=${PYTHON_PATH} -O /usr/local/bin/ws-dropbear
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# --- Install ws-ovpn
wget -q -O /usr/local/bin/ws-ovpn ${REPOSC}/sshws/ws-ovpn.py
chmod +x /usr/local/bin/ws-ovpn

cat > /etc/systemd/system/ws-ovpn.service << END
[Unit]
Description=Python Proxy Decode by RMBLVPN (OVPN)
Documentation=https://t.me/rmblvpn1
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=${PYTHON_PATH} -O /usr/local/bin/ws-ovpn 2086
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# --- Install ws-stunnel
wget -q -O /usr/local/bin/ws-stunnel ${REPOSC}/sshws/ws-stunnel
chmod +x /usr/local/bin/ws-stunnel

cat > /etc/systemd/system/ws-stunnel.service << END
[Unit]
Description=Python Proxy Decode by RMBLVPN (Stunnel)
Documentation=https://t.me/rmblvpn1
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=${PYTHON_PATH} -O /usr/local/bin/ws-stunnel
Restart=on-failure

[Install]
WantedBy=multi-user.target
END

# --- Aktifkan dan jalankan semua service
systemctl daemon-reload
systemctl enable ws-dropbear ws-ovpn ws-stunnel
systemctl restart ws-dropbear ws-ovpn ws-stunnel


# Auto cleanup
rm -f $0
exit 0
