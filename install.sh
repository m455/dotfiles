#!/bin/sh

if ! command -v tmux &> /dev/null; then
  sudo apt-get install -y tmux
fi

if ! command -v fzf &> /dev/null; then
  sudo apt-get install -y fzf
fi

if ! command -v rg &> /dev/null; then
  sudo apt-get install -y ripgrep
fi

if ! command -v tree &> /dev/null; then
  sudo apt-get install -y tree
fi

cp .vimrc .zshrc .tmux.conf "$HOME"/
. "$HOME"/.zshrc
