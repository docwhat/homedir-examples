# -*- sh -*-
# .zlogin is sourced in login shells.  It should
#     contain commands that should be executed only in
#     login shells.  It should be used to set the terminal
#     type and run a series of external commands (fortune,
#     msgs, from, etc).
#     It is sourced *after* .zshenv and .zshrc
#

mesg y || :

## Read generic login bits
for prof in "$HOME"/{.zsh/plugin,.shell}/*.login(rN); do
    if [ -r "$prof" ]; then
        . "$prof"
    fi
done
unset prof

########### EOF ###########
