#!/bin/bash
set -e

script_path="$(dirname $0)"
script_name="deploy-config"

cp -r -u "$script_path/.config" $HOME

i3lockr_path="$HOME/scripts/i3/i3lockr"
if [[ ! -e $i3lockr_path ]]; then
	echo "($script_name) **Warning**: i3lockr is required in this path: $i3lockr_path"
fi

if [[ $# -ne 0 ]]; then
	echo "has args"
	sudo cp -r -u "$script_path/keyd" /etc 
	sudo keyd reload
fi
