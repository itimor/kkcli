#!/bin/bash
colo_r() {
	case $1 in
	fate)
		local   a=$(echo $((RANDOM%6)))
        	echo -e "\033[3${a/0/3}m $2 \033[0m"
		;;
	fate_flash)
		local   a=$(echo $((RANDOM%6)))
        	echo -ne "\033[5;3${a/0/3}m $2 \033[0m"
#       	echo -e "\033[5;3${a/0/3}m $2 \033[0m" #not a new line
		;;
	black)
		echo -e "\033[30m $2 \033[0m"
		;;
	red)
		echo -e "\033[31m $2 \033[0m"	
		;;
	green)
		echo -e "\033[32m $2 \033[0m"
		;;
	yellow)
		echo -e "\033[33m $2 \033[0m"
		;;
	blue)
		echo -e "\033[34m $2 \033[0m"
		;;
	purple)
		echo -e "\033[35m $2 \033[0m"
		;;
	sky_blue)
		echo -e "\033[36m $2 \033[0m"
		;;
	white)
		echo -e "\033[37m $2 \033[0m"
		;;
	red_shan)
		echo -e "\033[31m\033[05m $2 \033[0m"	
		;;
	red_log)
		echo -e "${date}\033[31m $2 \033[0m"	
		;;
	green_log)
		echo -e "${date}\033[32m $2 \033[0m"
		;;
	*)
		colo_r red "color function input error"
	esac	
}
