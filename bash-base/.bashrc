# -*- sh -*-
# WHEN: This file is read when bash is invoked as an *interactive*
#       *non-login* shell

# Only run if shell is interactive.
if [[ $- != *i* ]] ; then
    return
fi

# We want the variables set up in the profile.
if [[ -r "$HOME/.bash_profile" ]]; then
    source "$HOME/.bash_profile"
fi

# If bash_completion exists, use it..
if [[ -r /etc/bash_completion ]] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## Default Prompt
export PS1='[\h][\W]\$ '

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
