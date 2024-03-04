#!/bin/bash

if [[ -z $1 ]]; then
	rofi -modi drun,run -show drun
else
	rofi -modi drun,run -show drun -filter $1
fi
