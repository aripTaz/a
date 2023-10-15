#!/bin/bash
#FN
#RERECHAN02
#indo-ssh.com
# =========================================
# OS Uptime
uptime="$(uptime -p | cut -d " " -f 2-10)"
DATE2=$(date -R | cut -d " " -f -5)
tram=$(free -m | awk 'NR==2 {print $2}')
uram=$(free -m | awk 'NR==2 {print $3}')
fram=$(free -m | awk 'NR==2 {print $4}')
#link izin ip vps
url_izin='https://raw.githubusercontent.com/aripTaz/ip/main/ip'

# Mendapatkan IP VPS saat ini
ip_vps=$(curl -s ifconfig.me)

# Mendapatkan isi file izin.txt dari URL
izin=$(curl -s "$url_izin")

# Memeriksa apakah konten izin.txt berhasil didapatkan
if [[ -n "$izin" ]]; then
  while IFS= read -r line; do
    # Memisahkan nama VPS, IP VPS, dan tanggal kadaluwarsa
    nama=$(echo "$line" | awk '{print $1}')
    ipvps=$(echo "$line" | awk '{print $2}')
    tanggal=$(echo "$line" | awk '{print $3}')

    # Memeriksa apakah IP VPS saat ini cocok dengan IP VPS yang ada di izin.txt
    if [[ "$ipvps" == "$ip_vps" ]]; then
      echo "Nama VPS: $nama"
      echo "IP VPS: $ipvps"
      echo "Tanggal Kadaluwarsa: $tanggal"
      break
    fi
  done <<< "$izin"

  # Memeriksa apakah IP VPS ditemukan dalam izin.txt
  if [[ "$ipvps" != "$ip_vps" ]]; then
    echo "IP VPS tidak ditemukan dalam izin.txt"
    exit 0
  fi
else
  echo "Konten izin.txt tidak berhasil didapatkan dari URL"
  exit 0
fi


vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"

trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
trg=$(grep -c -E "### " "/etc/trojan-go/akun.conf")
let trgo=$trg/2

# // Exporting Language to UTF-8
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'
#Download/Upload today
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload yesterday
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
#Download/Upload current month
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Clear
clear
export IP=$(curl ifconfig.me)
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
#Warna Teks underline
ug="\033[4;32m" # HIJAU
ur="\033[4;31m" # MERAH
uy="\033[4;33m" # KUNING
uw="\033[4;37m" # PUTIH
uu="\033[4;35m" # UNGU
uc="\033[4;36m" # CYANN
ub="\033[4;30m" # BLACK
#Warna Text 
c="\e[1;36m" # CYANN
y="\e[1;33m" # KUNING
g="\e[1;32m" # HIJAU
w="\e[1;37m" # PUTIH
u="\e[1;35m" # UNGU
r="\e[1;31m" # MERAH
NC="\e[0m"
# background
GB="\033[42;37m" # HIJAU BACKGROUND
RB="\033[41;37m" # MERAH BACKGROUND
MYIP=$(curl -sS ipv4.icanhazip.com)
clear   
     echo -e " ${w}${NC}"
                    echo -e "         ┌───────────────────────────────────────────┐"
		            echo -e "         |${GB}              BRINGAS TUNNEL              ${NC}" "|"
		            echo -e "         └───────────────────────────────────────────┘"
                    echo -e "         │ ${c} IP VPS  : $IPVPS ${NC}"
                    echo -e "         │ ${c} CPU     : $cpu_usage ${NC}"  
		            echo -e "         │ ${c} DOMAIN  : $domain ${NC}"
                    echo -e "         │ ${c} RAM     : $tram Mb ${NC}"
                    echo -e "         │ ${c} DATE    : $DATE${NC}"
		            echo -e "         │ ${c} ISP     : $ISP ${NC}"
                    echo -e "         └───────────────────────────────────────────┘"  
		            echo -e "         ┌───────────────────────────────────────────┐"
                    echo -e "         │${r}             Client : ${r}$Name${NC}"
                    echo -e "         │${r}             Xpired : ${r}$tanggal days ${NC}"
                    echo -e "         └───────────────────────────────────────────┘"
		            echo -e "                     ssh/ovh : $ssh1  vmess : $vma  vless : $vla  trojan : $tra"
		            echo -e
                    echo -e "         ${r}────────────────────────────────────────────${NC}"
                    echo -e "         ${y} [${u}•1${y}]${NC} SSH & UDP  "     "       ${y}[${u}•6${y}]${NC} CHECK RUNNING"
                    echo -e "         ${y} [${u}•2${y}]${NC} VMESS Xray "     "       ${y}[${u}•7${y}]${NC} RESTR SERVICE"  
                    echo -e "         ${y} [${u}•3${y}]${NC} VLESS Xray "     "       ${y}[${u}•8${y}]${NC} BACKUP MENU  " 
                    echo -e "         ${y} [${u}•4${y}]${NC} TROJAN-GO  "     "       ${y}[${u}•9${y}]${NC} CHANGE BANNER"
                    echo -e "         ${y} [${u}•5${y}]${NC} TROJAN-WS  "     "       ${y}[${u}10${y}]${NC} MENU SETTINGS"
		            echo -e "         ${r}────────────────────────────────────────────${NC}"
		            echo -e "                          "
                    echo -e "          ${w}             Version : 2.0.9 ${NC}"
		           echo -e "                       ${y}___${r}___${u}___${w}___${c}___${g}${NC}"
                   echo -e ""
                    read -p " Select menu : " opt
case $opt in
1|01) clear ; menu-ssh ;;
2|02) clear ; xmenu ;;
3|03) clear ; tmenu ;;
4|04) clear ; bmenu ;;
5|05) clear ; menu-set ;;
0) clear ; running ;;
a|A) clear ; about ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
