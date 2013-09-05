while true; do
  clear
  echo "Are you sure you can handle these settings? (y/N)"
  echo ""
  read yn
  clear
  case $yn in
    [Yy]* ) mv inputrc ~/.inputrc; rm -rf ~/.vim; mv vim/ ~/.vim/; rm -rf ~/.ascii_art; mv ascii_art/ ~/.ascii_art; mv tmux.conf ~/.tmux.conf; mv vimrc ~/.vimrc; mv zshrc ~/.zshrc; mv rc ~/.ssh; echo "Installtion complete! You can now remove this directory"; break;;
    [Nn]* ) echo "Installation cancelled"; break;;
  esac
done
