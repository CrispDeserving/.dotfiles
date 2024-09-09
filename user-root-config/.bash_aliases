alias mkdir="mkdir --parents --verbose"
alias aptdate="sudo apt update && sudo apt upgrade && sudo apt autoremove"
alias wget="wget -c"
alias lg="lazygit"

alias conf="cd $HOME/.dotfiles"
alias nconf="cd $HOME/.config/nvim"

cdn () {
	if [[ -z $1 ]] then
		jumps=1
	else
		jumps=$1
	fi

	for ((i=1; i<=$jumps; i++))
		do cd ..
	done
	pwd
}
alias up="cdn"
