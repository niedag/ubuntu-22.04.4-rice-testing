#!/bin/bash
set -u
if [ "$(uname -s)" = "Darwin" ]; then
    OS='macOS'
elif [ "$(uname -s)" = "Linux" ]; then
    OS='Linux'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

if [ OS='macOS']; then
    # Install xcode
    xcode-select --install

    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

elif [ OS='Linux' ]; then
    mkdir ~/Downloads
    mkdir ~/Documents
    mkdir ~/Pictures
    mkdir ~/Videos
    mkdir ~/Music
    mkdir ~/Pictures/screenshots
    mkdir ~/Pictures/wallpapers
    for i in wallpapers/*; do
        cp "$i" ~/Pictures/"$i"
    done
    mkdir ~/.fonts
    # Install MesloLGS NF
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -P ~/.fonts
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -P ~/.fonts
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -P ~/.fonts
    wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -P ~/.fonts
fi
