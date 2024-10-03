#!/bin/bash

THEME_DIR = "$HOME/.config/alacritty/themes"
REPO_URL = "https://github.com/alacritty/alacritty-theme"

# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p $THEME_DIR
if [ -d "$THEME_DIR" ]; then
    echo "Cloneing Alacritty themes repo..."
    git clone $REPO_URL $THEME_DIR
else
    echo "Themes repo already exists. Pulling lastest changes..."
    git -C $THEME_DIR pull
fi

echo "Starting Alacritty with the config..."
alacritty
