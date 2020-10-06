#!/bin/bash

echo "NOTICE: fail2cam is required."

## Install howdy package

sudo add-apt-repository ppa:boltgolt/howdy
sudo apt update -y
sudo apt install -y howdy

## Install howdy2cam script

cat << EOF | sudo tee /usr/local/bin/howdy2cam
#!/bin/bash

TGBOTTOKEN=\`cat /etc/fail2cam/tg-bot-token\`
TGCHATID=\`cat /etc/fail2cam/tg-chatid\`

for IMAGE in /lib/security/howdy/snapshots/*
do
  CAPTION=\${1:-howdy2cam}-\${IMAGE}
  (curl --silent --form chat_id=\${TGCHATID} --form photo="@\${IMAGE}" --form caption="\${CAPTION}" "https://api.telegram.org/bot\${TGBOTTOKEN}/sendPhoto" | grep -F '{"ok":true,' && rm \${IMAGE}) &
done

exit 0
EOF
sudo chmod +x /usr/local/bin/howdy2cam

## Configure pam for howdy and howdy2cam

pam_auth_file="/etc/pam.d/common-auth"
pam_howdy="auth [success=4 default=ignore] pam_python.so \/lib\/security\/howdy\/pam.py"
pam_howdy2cam_fail="auth [default=ignore] pam_exec.so seteuid \/usr\/local\/bin\/howdy2cam 'FAILED'"
pam_howdy2cam_login="auth [default=ignore] pam_exec.so seteuid \/usr\/local\/bin\/howdy2cam 'LOGIN'"

grep fail2cam ${pam_auth_file} || {
  echo "FAILED: fail2cam not found in pam."
  exit 1
}
sudo sed -i "/pam_unix.so nullok_secure/i ${pam_howdy}\n${pam_howdy2cam}" ${pam_auth_file}
sudo sed -i "/pam_permit.so/i ${pam_howdy2cam}" ${pam_auth_file}

