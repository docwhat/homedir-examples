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

########### EOF ###########
