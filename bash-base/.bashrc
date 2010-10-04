# -*- sh -*-
# WHEN: This file is read when bash is invoked as an *interactive*
#       *non-login* shell

# If bash_completion exists, use it..
if [ -r /etc/bash_completion ]; then
    . /etc/bash_completion
fi

## Default Prompt
export PS1='[\h][\W]\$ '

## Read Generic ENV files
for envfile in "$HOME/.shell/"*.env; do
	if [ -r "$envfile" ]; then
		source "$envfile"
	fi
done
unset envfile

## Read Generic RC
for rcfile in "$HOME/.shell/"*.rc; do
	if [ -r "$rcfile" ]; then
		source "$rcfile"
	fi
done
unset rcfile

## Read rc bits
for rcfile in "$HOME/.bash/plugin/"*.rc; do
	if [ -r "$rcfile" ]; then
		source "$rcfile"
	fi
done
unset rcfile
########### EOF ########### 
