# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

[[ ":$PATH:" != *":$HOME/.scripts"* ]] && PATH="$HOME/.scripts:${PATH}"

if [ ! "$MANPATH" == *$HOME/.local/share/man* ]; then
    export MANPATH="$MANPATH:$HOME/.local/share/man/"
fi

export WORKSPACE="$HOME/projects"

OLD_PROJECT=$PROJECT
export PROJECT=
if [ ! "$OLD_PROJECT" == "$PROJECT" ]; then
    export PROJECT_INCLUDE_DIRS=$(getProjectIncludes $PROJECT)
fi

