#!/bin/bash
set -e

script_path="$(dirname $0)"
script_name="deploy-config"

show_help() {
	echo "
	$script_name

	Usage:
		-h/--help: Show this help.
		-s/--sudo: Execute commands that needs sudo permissions.
	"
}

run_sudos() {
	sudo cp -r -u $script_path/login_text.txt /etc/motd
	sudo cp -r -u "$script_path/keyd" /etc
	sudo keyd reload
}

if [[ $# -ne 0 ]]; then
	case $1 in
		-s|--sudo)
			run_sudos
		;;

		--help|-h)
			show_help
		exit 0;;

		*)
			show_help
			echo "($script_name): **Fatal**: Invalid args."
		exit 1;;
	esac
fi

i3lockr_path="/usr/bin/i3lockr"
if [[ ! (-e $i3lockr_path) ]]; then
	echo "($script_name) **Warning**: i3lockr is required in this path: $i3lockr_path"
fi

rsync -a $script_path/config/ $HOME/.config
rsync -a $script_path/user-root-config/ $HOME

tmux source-file ~/.config/tmux/tmux.conf || error_code=$? # prevents exit on error
killall dunst || error_code=$?
notify-send --urgency=low --expire-time=5000 "Config file updated" "Try to see what changed!"
