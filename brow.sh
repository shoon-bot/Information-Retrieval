CYAN='\033[0;36m'
NC='\033[0m' # No Color

clear
while true; do
	printf "Options: \n"
	printf "────────\n"
	printf "enter 'b' to go back\n"
	printf "enter 'q' to quit\n"
	printf "Enter a URL to display content\n\n"
	read -p "Input: " choice
	
	if [ $choice == 'b' ]; then
		printf "Going to previous website...\n"
	elif [ $choice == 'q' ]; then
		printf "Quitting ...\n"
		break
	else
		cols=$(( $(tput cols) + 2 ))
		s=$(printf "%-${cols}s" "─")
		
		clear
		printf "website: %s \n" "$choice"
		
		echo -e "${CYAN}${s// /─}${NC}"
		links -dump $choice
		echo -e "${CYAN}${s// /─}${NC}\n"
	fi
done
