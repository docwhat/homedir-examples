# -*- sh -*-
# WHEN: This file is read when bash is invoked as an *interactive*
#       *non-login* shell

# All the login/non-interactive/blah logic is in ~/.bash_profile.
if [[ -r "$HOME/.bash_profile" ]]; then
    source "$HOME/.bash_profile"
fi

########### EOF ###########
