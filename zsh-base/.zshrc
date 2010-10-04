# -*- sh -*-
#
# .zshrc is sourced in interactive shells.  It
#     should contain commands to set up aliases,
#     functions, options, key bindings, etc.
#
#     It is sourced *after* .zshenv and before .zlogin

## Default Prompt
export PS1='%n@%m %B%3~%b%# '

## Read rc bits
for rcfile in "$HOME"/{.zsh/plugin,.shell}/*.rc(rN); do
    if [ -r "$rcfile" ]; then
        . "$rcfile"
    fi
done
unset rcfile

########### EOF ###########
