####### Install Softwares
softwares="vim tmux zsh"

for software in $softwares; do
  if ! type $software > /dev/null; then
    sudo apt-get install $software
  fi
done

####### Variables

dir=~/dotFiles
files="vimrc zshrc tmux.conf"
vundle_link="https://github.com/VundleVim/Vundle.vim.git"
vundle_path=~/.vim/bundle/Vundle.vim

####### Loop creating symlink 
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $dir"
  mv ~/.$file ~/$dir/
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done

if [ ! -d $vundle_path ];
  then git clone $vundle_link $vundle_path
  else echo "No need to clone file already exists"
fi
