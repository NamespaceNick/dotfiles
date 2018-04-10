# Script to install Vim 8.0+ on CAEN (non-root) users
echo "############### Installing Vim ###############"
set -e
mkdir -p $HOME/vim_tmp
VIMM=$HOME/vim_tmp
pushd $VIMM

# Vim
echo "##### Fetching Vim repository"
git clone https://github.com/vim/vim.git
pushd vim/src/
./configure --prefix=$HOME --disable-gui && make && make install
popd

# Vim-plug
echo "##### Fetching Vim-Plug"
if [[ ! -e $HOME/.vim/autoload/plug.vim ]]; then
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
#TODO: Add PlugInstall command


# ALL DONE
rm -rf $VIMM
popd
