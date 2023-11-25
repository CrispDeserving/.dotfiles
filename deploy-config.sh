#!/bin/bash
set -e

script_path="$(dirname $0)"
script_name="deploy-config"

i3lockr_path="$HOME/scripts/i3/i3lockr"
if [[ ! -e $i3lockr_path ]]; then
	echo "($script_name) **Warning**: i3lockr is required in this path: $i3lockr_path"
fi

rsync -a $script_path/config/ $HOME/.config
if [[ $# -ne 0 ]]; then
	sudo cp -r -u "$script_path/keyd" /etc 
	sudo keyd reload
fi

killall dunst || error_code=$? # prevents exit on error
notify-send --urgency=low --expire-time=5000 "Config file updated" "Try to see what changed!"
