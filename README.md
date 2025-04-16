# dotfiles

![Debian](https://github.com/omemoji/dotfiles/actions/workflows/debian.yml/badge.svg) ![macOS](https://github.com/omemoji/dotfiles/actions/workflows/macos.yml/badge.svg) 

## Overview

Omemoji's Dotfiles
Reference for ricing Ubuntu 22.04.4 LTS x86_64

## Supported OS

This dotfiles supports Debian, Void (Linux) and macOS.

<div style="display:flex;">
<a href="https://debian.org/download" style="margin-right:10px;">
<img  src="https://www.debian.org/logos/openlogo-nd.svg" alt="Debian" height="90"></a>
<a href="https://voidlinux.org/download/">
<img src="https://a-hel-fi.m.voidlinux.org/logos/void-dark2.svg" alt="Void" height="90"></a>
<a href="https://apple.com/macos" style="">
<img  src="https://upload.wikimedia.org/wikipedia/commons/1/1b/Apple_logo_grey.svg" alt="macOS" height="90"></a>

</div>

## Usage

- Requirements: `make, git, gawk`

```sh

git clone https://github.com/omemoji/dotfiles.git

cd git

# Install all apps and dotfiles
make all
## if you use Linux in Japanese:
make all-ja

# set Void Linux (experimental)
make void
make void-ja

# Install only dotfiles
make link

# (optional) Install flatpak apps
make flatpak


```

## Applications

### Linux

i3-based desktop environment, which is extremely light and fast

<details>
<summary>Debian</summary>

| Categories              | Application                 |
| ----------------------- | --------------------------- |
| Window manager          | i3                          |
| Launcher                | i3-dmenu-desktop            |
| Input method (Japanese) | Fcitx5 and Mozc             |
| Sound                   | PipeWire                    |
| Terminal                | rxvt-unicode                |
| Browser                 | Google Chrome, Firefox, w3m |
| Mailer                  | Thunderbird                 |
| Editor                  | Visual Studio Code, Vim     |
| File manager            | Thunar, Ranger              |
| Image viewer            | Ristoretto                  |
| PDF viewer              | Evince                      |
| Media player            | VLC                         |
| Image editor            | GIMP, Inkscape, Krita       |

</details>

No longer current version 
