# /etc/bash/bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. So make sure this doesn't display
# anything or bad things will happen !

#
# ~/.bashrc
#

# grep color
export GREP_COLOR="1;33"

# aliases
alias ls='ls --color=auto'
alias cal='cal -m'
alias grep='grep --color=auto'
alias freq='watch grep \"cpu MHz\" /proc/cpuinfo'
alias ethstatus='ethstatus -i wlan0'
alias stickon='sudo mount /dev/sdc1 /mnt/usb'
alias stickoff='sudo umount /dev/sdc1'
alias hibernate='systemctl hibernate'
alias suspend='systemctl suspend'
alias reboot='systemctl reboot'
alias rukey='loadkeys ru'
alias wifi-restart='sudo systemctl restart netctl-auto@wlp5s0.service'
alias vpn-restart='sudo systemctl restart openvpn@Germany.service'
alias aur='makepkg -sri'
alias torchroot='chroot --userspec=tor:tor /opt/torchroot /usr/bin/tor'
#alias tunnel='ssh -D 5222 login@server -N'

# only unique commands in bash history
export HISTCONTROL=ignoredups

# default editor is GNU/Emacs
export ALTERNATE_EDITOR=vi EDITOR=emacs VISUAL=emacs

# bash prompt decoration
PS1="\[\e[1;32m\]\u@\h (\W) \$HISTCMD : \[\e[m\]"

# browser
if [ -n "$DISPLAY" ]; then
    export BROWSER=firefox
else
    export BROWSER=lynx
fi

# pager
export PAGER=less
