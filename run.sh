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
  if [ ! -f ~/.$file ]; then
    echo "Moving any existing dotfiles from ~ to $dir"
    mv ~/.$file ~/$dir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
  fi
done

if [ ! -d $vundle_path ];
  then git clone $vundle_link $vundle_path
fi

######## Adding theme to vim

theme_name=Tomorrow-Night-Eighties.vim

if [ ! -d ~/.vim/colors/ ]; then
  mkdir ~/.vim/colors/
fi

if [ ! -f ~/.vim/colors/$theme_name ]; then
  ln -s $dir/vim/colors/$theme_name ~/.vim/colors/$theme_name
fi
