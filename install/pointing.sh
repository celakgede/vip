#!/bin/bash
junc0() { rm -rf $0; exit 0; }
trap junc0 SIGINT
trap junc0 SIGTERM
trap junc0 EXIT

# Warna-warna
biru="\033[1;36m"
hijau="\e[92;1m"
green='\e[32m'
red='\e[38;5;208m'
NC='\e[0m'

CF_ID="sukaratarmbl6@gmail.com"
CF_KEY="735a4b90af2f1e32b02669e4c9a3ec34ff78d"
DOMAIN1="rmbltunel.cloud"
sub=$(cat /root/subdomainx)
SUB_DOMAIN1="${sub}.${DOMAIN1}"
SUB_DOMAIN01="*.${SUB_DOMAIN1}"
IP=$(curl -sS ipv4.icanhazip.com)

# SUB 1
set -euo pipefail
IP1=${IP}
echo -e ""
echo -e "Sedang pointing ${biru}${SUB_DOMAIN1}${NC}..."

ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN1}&status=active" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN1}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
    RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" \
        --data '{"type":"A","name":"'${SUB_DOMAIN1}'","content":"'${IP1}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'${SUB_DOMAIN1}'","content":"'${IP1}'","ttl":120,"proxied":false}')

echo -e "${hijau}Sukses!${NC}"

# WILDCARD
echo -e "Sedang pointing ${biru}${SUB_DOMAIN01}${NC}..."

ZONE=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones?name=${DOMAIN1}&status=active" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)

RECORD=$(curl -sLX GET "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records?name=${SUB_DOMAIN01}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" | jq -r .result[0].id)

if [[ "${#RECORD}" -le 10 ]]; then
    RECORD=$(curl -sLX POST "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records" \
        -H "X-Auth-Email: ${CF_ID}" \
        -H "X-Auth-Key: ${CF_KEY}" \
        -H "Content-Type: application/json" \
        --data '{"type":"A","name":"'${SUB_DOMAIN01}'","content":"'${IP1}'","ttl":120,"proxied":false}' | jq -r .result.id)
fi

RESULT=$(curl -sLX PUT "https://api.cloudflare.com/client/v4/zones/${ZONE}/dns_records/${RECORD}" \
    -H "X-Auth-Email: ${CF_ID}" \
    -H "X-Auth-Key: ${CF_KEY}" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'${SUB_DOMAIN01}'","content":"'${IP1}'","ttl":120,"proxied":false}')

echo -e "${hijau}Sukses!${NC}"
echo -e ""
sleep 3
clear

# Pemberitahuan selesai
echo -e ""
echo -e "${biru}┌──────────────────────────────────────────┐${NC}"
echo -e "${biru}│   ${hijau}POINTING DOMAIN KE CLOUDFLARE SELESAI  ${biru}│${NC}"
echo -e "${biru}└──────────────────────────────────────────┘${NC}"
echo -e ""
echo -e "${hijau}Berhasil${NC} Pointing ${biru}${SUB_DOMAIN1}${NC}"
echo -e "         Untuk ip ${biru}${IP}${NC}"
echo -e ""

TIMES="10"
CHATID="644716"
KEY="695100:AAF8_cbbAezmjkC55yoabr7OWgbL8"
URL="https://api.telegram.org/bot${KEY}/sendMessage"
TIMEZONE=$(printf '%(%H:%M:%S)T')
TEXT="
────────────────────
<b>   ⚠️ BERHASIL POINTING ⚠️</b>
────────────────────
<code>Subdomain :</code> <code>${SUB_DOMAIN1}</code>
<code>IP VPS    :</code> <code>${IP1}</code>
────────────────────
<b>    ⚠️ RMBL-VPN ⚠️</b>
"&reply_markup={"inline_keyboard":[[{"text":"TELEGRAM","url":"https://t.me/alawivpn"}]]}"

curl -s --max-time ${TIMES} -d "chat_id=${CHATID}&disable_web_page_preview=1&text=${TEXT}&parse_mode=html" ${URL} >/dev/null

echo "${SUB_DOMAIN1}" > /root/domain
echo "${SUB_DOMAIN1}" > /etc/xray/domain
echo "${SUB_DOMAIN1}" > /etc/v2ray/domain
echo "${SUB_DOMAIN1}" > /etc/xray/scdomain
echo "IP=${SUB_DOMAIN1}" > /var/lib/ipvps.conf
clear
rm -rf $0
exit 0
