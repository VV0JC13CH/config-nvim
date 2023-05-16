# Setup neovim

```fish
sudo apt install neovim
```

## Install vim-plug

Follow instructions from: https://github.com/junegunn/vim-plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

## Clone this repository to ~/.config/nvim

```fish
git clone https://github.com/VV0JC13CH/config-nvim.git ~/.config/nvim
```

## Open neovim and get plugins

```vim
:PlugInstall
```

