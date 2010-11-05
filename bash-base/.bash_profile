# -*- sh -*-
# WHEN: This file is read when bash is invoked as an *interactive*
#       *login* shell
#       It's read right after /etc/profile

## Read Generic ENV files
for envfile in "$HOME/.shell/"*.env; do
    if [ -r "$envfile" ]; then
        source "$envfile"
    fi
done
unset envfile

# Only run if shell is interactive.
if [[ $- = *i* ]] ; then
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

    ## Read rc plugin parts.
    for rcfile in "$HOME/.bash/plugin/"*.rc; do
        if [ -r "$rcfile" ]; then
            source "$rcfile"
        fi
    done
    unset rcfile
fi


########### EOF ###########
