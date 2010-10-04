# -*- sh -*-
# .zshenv is sourced on all invocations of the
#       shell, unless the -f option is set.  It should
#       contain commands to set the command search path,
#       plus other important environment variables.
#       .zshenv should not contain commands that product
#       output or assume the shell is attached to a tty.
#       It is sourced before all other files.


## We never want CVS to use rsh instead of ssh...
export CVS_RSH=ssh

## Setup the function path
fpath=(~/.zsh/functions $fpath)
typeset -gU fpath


## Read Generic ENV files
for envfile in "$HOME"/{.zsh/plugin,.shell}/*.env(rN); do
    if [ -r "$envfile" ]; then
        . "$envfile"
    fi
done
unset envfile

########### EOF ###########
