####### Variables

dir=~/dotFiles
files="vimrc zshrc tmux.conf"

####### Loop creating symlink 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $dir"
    mv ~/.$file ~/$dir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# cloning vundle 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
