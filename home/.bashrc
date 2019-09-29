source ~/.files/profile/profile.sh
# eval "$(_TMUXP_COMPLETE=source tmuxp)"
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
