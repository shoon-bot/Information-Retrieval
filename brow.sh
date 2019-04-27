printf "Enter a website: "
read site
terminal=/dev/pts/1
columns=$(stty -a <"$terminal" | grep -Po '(?<=columns )\d+')
cols=$(tput cols)

printf "Displaying website below: \n"
s=$(printf "%-${cols}s" "_")
echo "${s// /_}"
echo ""
links -dump $site
