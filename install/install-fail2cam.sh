#!/bin/bash

CONF="/etc/fail2cam"

case $1 in
	"install")
		sudo apt install fswebcam -y

		sudo mkdir -p ${CONF}
		read -p "[fail2cam] Input Telegram bot-token:" TG_BOT_TOKEN
		echo $TG_BOT_TOKEN | sudo tee ${CONF}/tg-bot-token
		read -p "[fail2cam] Input Telegram chatid:" TG_CHATID
		echo $TG_CHATID | sudo tee ${CONF}/tg-chatid
		sudo chmod go-r -R ${CONF}

		cat << EOF | sudo tee /usr/local/bin/fail2cam
#!/bin/bash
IMAGE=/tmp/"\`hostname\`-\`date +%Y%m%d-%H%M%S%N\`.png"
fswebcam -r 1920x1080 --png 9 -S 7 --flip v --flip h \${IMAGE}

TGBOTTOKEN=\`cat /etc/fail2cam/tg-bot-token\`
TGCHATID=\`cat /etc/fail2cam/tg-chatid\`
curl --silent --form chat_id=\${TGCHATID} --form photo="@\${IMAGE}" --form caption="fail2cam-\${IMAGE}" "https://api.telegram.org/bot\${TGBOTTOKEN}/sendPhoto"

exit 0
EOF
		sudo chmod +x /usr/local/bin/fail2cam

		pam_fail2cam="auth [default=ignore] pam_exec.so seteuid \/usr\/local\/bin\/fail2cam"
		sudo grep fail2cam /etc/pam.d/common-auth || sudo sed -i "/pam_unix.so nullok_secure/a ${pam_fail2cam}" /etc/pam.d/common-auth
		sudo sed -i "s/success=1/success=2/" /etc/pam.d/common-auth
		;;
	"uninstall")
		sudo rm -rf ${CONF}
		sudo rm -f /usr/local/bin/fail2cam
		sudo sed -i "s/success=2/success=1/" /etc/pam.d/common-auth
		sudo grep fail2cam /etc/pam.d/common-auth && sudo sed -i -e "/pam_unix.so nullok_secure/{n;d}" /etc/pam.d/common-auth
		;;
	*)
		echo $(basename $0) install
		echo $(basename $0) uninstall
esac
