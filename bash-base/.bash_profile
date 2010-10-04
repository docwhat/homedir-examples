# -*- sh -*-
# WHEN: This file is read when bash is invoked as an *interactive*
#       *login* shell
#       It's read right after /etc/profile

## Read the .bashrc -- normally only read for interactive non-login shells
if [ -r "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

## Read profile bits
for prof in "$HOME/.bash/plugin/"*.login; do
	if [ -r "$prof" ]; then
		source "$prof"
	fi
done
unset prof

## Read generic profile bits
for prof in "$HOME/.shell/"*.login; do
	if [ -r "$prof" ]; then
		source "$prof"
	fi
done
unset prof

## Read Generic ENV files
for envfile in "$HOME/.shell/"*.env; do
	if [ -r "$envfile" ]; then
		source "$envfile"
	fi
done
unset envfile

########### EOF ########### 
