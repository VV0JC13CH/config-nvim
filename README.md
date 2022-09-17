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

## Coc requirements and configuration

```fish
sudo apt install npm
sudo apt install build-essential checkinstall libssl-dev
sudo npm install -g n
sudo n stable
sudo npm install -g yarn
cd /home/wbobrowski/.local/share/nvim/plugged/coc.nvim
yarn install
```

## Coc extensions

```vim
:CocInstall coc-json coc-html coc-pyright coc-rust-analyzer coc-snippets coc-go
coc-tsserver coc-yaml coc-sh
```

### Bonus: Integration with kitty

```fish
sudo vim /usr/share/applications/nvim.desktop
# Change Exec and Terminal keys
Exec=kitty nvim %F
Terminal=false
```
