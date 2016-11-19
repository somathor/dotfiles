[ ! -s $HOME/.vim ] && mkdir $HOME/.vim
[ ! -s $HOME/.vim/dict ] && cp -r "$(dirname $0)"/dict     $HOME/.vim/
