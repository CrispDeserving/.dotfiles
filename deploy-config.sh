#!/bin/bash
set -e

script_path="$(dirname $0)"

cp -r -u "$script_path/.config" $HOME
