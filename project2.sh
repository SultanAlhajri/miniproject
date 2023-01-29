#!/usr/bin/env bash

# sp="/-\|"
# sc=0
# spin() {
#    printf "\b${sp:sc++:1}"
#    ((sc==${#sp})) && sc=0
# }
# endspin() {
#    printf "\r%s\n" "$@"
# }



function creatRepo {
	echo -n "Enter Github Access Token:"
	read -r Usertoken

	echo -n "Enter Github Username:"
	read -r username

    echo -n "Repository name: ";
    read repoName;


	   
	   curl -u "$username:$Usertoken" https://api.github.com/user/repos -d '{"name":"'${repoName}'"}'
	   

    

	 
}




clear
cat << EOF
Please Select:
    1. Display System Information
    2. Display Disk Space
    3. Display Home Space Utilization
    4. Create github repository
    0. Quit

EOF
echo -n 'Enter selection [0-4]: '
read -r sel

case $sel in
	0) echo "Program terminated.";;
	1) echo "Hostname: $HOSTNAME"; uptime;;
	2) df -h;;
	3)
		if [ "$UID" = 0 ]; then
			echo "Home Space Utilization (All Users)"
			du -sh /home/*
		else
			echo "Home Space Utilization ($USER)"
			du -sh "$HOME"
		fi
	;;
	4) creatRepo ;;
	*)
		echo "Invalid entry." >&2
		exit 1
esac


