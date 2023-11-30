#!/bin/bash
set -e

script_path="$(dirname $0)"
script_name="lxapperance-fetch"

rsync -a $HOME/.gtkrc-2.0 $script_path/user-root-config/

