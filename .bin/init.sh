#!/bin/bash
set -eu
if [ "$(uname -s)" = "Darwin" ]; then
    echo 'macOS'
elif [ "$(uname -s)" = "Linux" ]; then
    echo 'Linux'
else
    echo "Your platform ($(uname -a)) is not supported."
    exit 1
fi

if [ "$(uname -s)" = "Darwin" ]; then
    # Install xcode
    sudo spctl --master-disable
    if type "xcode-select" >/dev/null 2>&1; then
        echo "command line tools already installed"
    else
        xcode-select --install >/dev/null
    fi
    # Install brew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    if [ "$(uname -m)" = "arm64" ]; then
        eval "$(/opt/homebrew/bin/brew shellenv)" >/dev/null
    fi
    # Disable auto-capitalization
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
    # Disable animation at application launch
    defaults write com.apple.dock launchanim -bool false
    # Display the status bar
    defaults write com.apple.finder ShowStatusBar -bool true
    # Display the path bar
    defaults write com.apple.finder ShowPathbar -bool true
elif [ "$(uname -s)" = "Linux" ]; then
    mkdir -p ~/Downloads
    mkdir -p ~/Documents
    mkdir -p ~/Pictures
    mkdir -p ~/Videos
    mkdir -p ~/Music
    mkdir -p ~/Pictures/screenshots
    mkdir -p ~/Pictures/wallpapers
    for i in "$(pwd)/wallpapers"/??*; do
        cp "$i" "$HOME/Pictures/wallpapers"
    done
    if [ -e "/etc/default/keyboard" ]; then
        echo "Caps to Ctrl"
        if [ "$(cat /etc/default/keyboard)"=*XKBOPTIONS* ]; then
            sudo awk -i inplace '/XKBOPTIONS/{gsub($0,"XKBOPTIONS=\"ctrl:nocaps\"")};{print($0)}' /etc/default/keyboard
        else
            echo "XKBOPTIONS=\"ctrl:nocaps\"" >>/etc/default/keyboard
        fi
    fi
    if [ "$(cat /etc/os-release | grep ^ID | sed -e "s/ID=//g")" = "debian" ]; then
        if [ -e "/etc/apt/sources.list" ]; then
            echo "Debian: append software sources"
            sudo awk -i inplace '{if($1 != "#") {gsub("main","main contrib");print($0)} else{print($0)}}' /etc/apt/sources.list
            sudo apt-get update >/dev/null 2>&1
        fi
        yes | sudo apt-get update
        yes | sudo apt-get install wget curl jq unzip
    fi
fi
