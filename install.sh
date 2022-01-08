#!/bin/zsh
echo "Creating Symbolic links"
ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/p10k.zsh ~/.p10k.zsh
ln -sf $(pwd)/asdf/tool-versions ~/.tool-versions
ln -sf $(pwd)/asdf/asdfrc ~/.asdfrc
ln -sf $(pwd)/dir_colors ~/.dir_colors
mkdir -p ~/.config/nvim
ln -sf $(pwd)/vimrc ~/.config/nvim/init.vim
ln -sf $(pwd)/coc-settings.json ~/.config/nvim/coc-settings.json
echo "Linked successfully. Enjoy!!"
