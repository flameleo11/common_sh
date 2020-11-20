# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "/opt/wine-staging/bin/" ] ; then
    PATH="$PATH:/opt/wine-staging/bin/"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "/drive_d/work/bin/" ] ; then
    PATH="/drive_d/work/bin/:$PATH"
fi


# set PATH so it includes user's private bin if it exists
if [ -d "/usr/bin/v2ray/" ] ; then
    PATH="$PATH:/usr/bin/v2ray/"
fi

# if [ -d "/drive_d/dev/mongodb4/bin" ] ; then
#     PATH="$PATH:/drive_d/dev/mongodb4/bin"
# fi


