alias cls='clear'
alias reload='. ~/.zshrc'
alias tmux='tmux -2'
alias view='vim -R'

case ${OSTYPE} in
  darwin*)
    # setting for mac
    alias dsstore='find ~/ -name .DS_Store -exec rm {} \;'
    alias remove-localstorage='rm -rf "$HOME/Library/Application Support/Google/Chrome/Default/Local Storage"'
    alias serial-console='screen /dev/tty.usbserial-FTXV1OVI'
    ;;
  linux*)
    # setting for linux
    ;;
esac
