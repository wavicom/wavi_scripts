#!/bin/bash

tred=$(tput setaf 1); tgreen=$(tput setaf 2); tyellow=$(tput setaf 3); tblue=$(tput setaf 4); tmagenta=$(tput setaf 5); tcyan=$(tput setaf 6); treset=$(tput sgr0); tclear=$(tput clear); twbg=$(tput setab 7)

function install_sentinel {

		echo -e "$tyellow""Install WAVI Sentinel"
		sudo apt-get update >/dev/null 2>&1
		sudo apt-get -y install python-virtualenv >/dev/null 2>&1
		cd >/dev/null 2>&1
		git clone https://github.com/wavicom/sentinel.git >/dev/null 2>&1
		cd sentinel >/dev/null 2>&1
		virtualenv ./venv >/dev/null 2>&1
		./venv/bin/pip install -r requirements.txt >/dev/null 2>&1
		crontab /etc/crontab
		crontab -l | { cat; echo "* * * * * cd ~/sentinel && ./venv/bin/python bin/sentinel.py >/dev/null 2>&1" ;} | crontab -
		cd >/dev/null 2>&1
		echo -e "$tgreen""Complete"
		echo -e "$tyellow""Please check the functionality of Sentinel with the command:"
		echo -e "$tgreen""cd sentinel && ./venv/bin/py.test ./test""$treset"
}

clear
echo "$tgreen""Sentinel Install Script for WAVI"
install_sentinel
rm setup_wavi_only_sentinel.sh >/dev/null 2>&1
