alias mkdir="mkdir --parents --verbose"
alias aptdate="sudo apt update && sudo apt upgrade" 
alias wget="wget -c"

cdn () {
	pushd .
	for ((i=1; i<=$1; i++))
		do cd ..
	done
	pwd
}
alias up="cdn"
