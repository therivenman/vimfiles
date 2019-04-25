vimfiles
========

My VIM configuration files

Installation:

1. Clone repo:

  ```
  git clone https://github.com/therivenman/vimfiles.git ~/.vim
  ln -s ~/.vim/vimrc ~/.vimrc
  ```
2. Install vim-plug:

  ```
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ```

3. Install plugins:

  Launch `vim` and run `:PluginInstall`
