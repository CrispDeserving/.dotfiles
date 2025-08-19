alias mkdir="mkdir --parents --verbose"
alias rm="rm --interactive=once --verbose"

alias aptdate="sudo apt update; sudo apt upgrade; sudo apt autoremove"
alias wget="wget -c"
alias pingle="ping google.com"

alias lg="lazygit"

alias conf="cd $HOME/.dotfiles"
alias nconf="cd $HOME/.config/nvim"

function cdn() {
	if [[ -z $1 ]]; then
		jumps=1
	else
		jumps=$1
	fi

	for ((i = 1; i <= $jumps; i++)); do
		cd ..
	done
	pwd
}
alias up="cdn"

function latest() {
	if [[ -z $1 ]]; then
		echo "latest: No arguments given."
		return 1
	fi

	if [[ -z $2 ]]; then
		items=1
	else
		items=$2
	fi

	directory=$1
	if [[ $directory != */ ]]; then
		directory=$directory/
	fi

	ls -t $directory | head -n $items | sed -e "s_^_${directory}_"
}

# From StackOverflow:
# https://unix.stackexchange.com/a/724624
function tmux-pwd() {
	if [[ -z $(tmux ls) ]]; then
		>&2 echo "tmux-pwd: No current sessions open, exiting..."
		return 1
	fi

	if [[ -z $TMUX ]]; then
		>&2 echo "tmux-pwd: Currently outside a tmux session, will return the latest session's cwd."
	fi

	TMPFILE=$(mktemp /tmp/tps-report.XXXXXXXXXX) || exit 1
	tmux run "printf '#{session_path}\n' > \"$TMPFILE\""
	cat "$TMPFILE"
	rm $TMPFILE >/dev/null
}
