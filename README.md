# Install neovim
```
sudo apt install neovim
```
# Install vim-plug
Follow instructions from: https://github.com/junegunn/vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
# Clone this repository to ~/.config/nvim
```
git clone https://github.com/VV0JC13CH/config-nvim.git ~/.config/nvim
```
# Open neovim and get plugins
```
:PlugInstall
```
# Coc requirements and configuration
```
sudo apt install npm
sudo apt install build-essential checkinstall libssl-dev
sudo npm install -g n
sudo n stable
sudo npm install -g yarn
cd /home/wbobrowski/.local/share/nvim/plugged/coc.nvim
yarn install
```
# Coc extensions:
```
:CocInstall coc-json coc-pyright coc-rust-analyzer coc-snippets coc-go coc-tsserver coc-yaml coc-sh
```
