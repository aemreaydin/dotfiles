#!/bin/bash

echo 'ZDOTDIR="$HOME/.config/zsh"' > "$HOME/.zshenv"
echo 'source "$ZDOTDIR/.zshenv"'

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Install brew packages
brew install zoxide lsd cmake ninja llvm node fzf ripgrep tree-sitter
