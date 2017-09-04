####### Variables

dir=~/dotFiles
files="vimrc zshrc"

####### Loop creating symlink 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $dir"
    mv ~/.$file ~/$dir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
