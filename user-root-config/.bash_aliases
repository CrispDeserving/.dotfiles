alias mkdir="mkdir --parents --verbose"
alias aptdate="sudo apt update && sudo apt upgrade && sudo apt autoremove" 
alias wget="wget -c"

alias conf="cd $HOME/.dotfiles"
alias nconf="cd $HOME/.config/nvim"

cdn () {
	pushd .
	for ((i=1; i<=$1; i++))
		do cd ..
	done
	pwd
}
alias up="cdn"
