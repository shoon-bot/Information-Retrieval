GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color
total=0
current=0


Array_add() {
	if [ $total -lt 10 ]; then
		Array[$total]=$choice
		((total++))
		current=$total
		#printf "total = %d, current = %d" "$total" "$current"
	else
		current=$total
		Array=("${Array[@]:1:9}" "$choice")
		#printf " not entering if....\ntotal = %d, current = %d" "$total" "$current"
	fi
}


Array_display() {
	clear
	for ((i=0; i<=total; i++)); do
		printf "${CYAN} | ${NC}"
		if [ $i == $((current - 1)) ]; then
			printf "${GREEN}${Array[$i]}${NC}"
		else
			printf "${Array[$i]}"
		fi
	done
	
	# Prints 2 less '─' characters but works fine for '_'
	# Compensating by adding 2 to cols
	cols=$(( $(tput cols) + 2 )) 
	s=$(printf "%-${cols}s" "─")

	echo -e "\n${CYAN}${s// /─}${NC}"
	links -dump ${Array[$((current -1))]}
	echo -e "${CYAN}${s// /─}${NC}\n"
}


clear
while true; do
	printf "Options: \n"
	printf "────────\n"
	printf "enter 'b' to go back\n"
	printf "enter 'f' to go forward\n"
	printf "enter 'q' to quit\n"
	printf "Enter a URL to display content\n\n"
	read -p "Input: " choice
	
	if [ $choice == 'b' ]; then
		if [ $current -gt 1 ]; then
			((current--))
		fi
		Array_display
	
	elif [ $choice == 'f' ]; then
		if [ $current -lt $total ]; then
			((current++))
		fi
		Array_display

	elif [ $choice == 'q' ]; then
		printf "Quitting ...\n"
		break
	
	else
		Array_add
		Array_display
		
	fi
done
