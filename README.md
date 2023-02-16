# dotfiles  
This repository is for my own personal set up. This is only intended to work for me and to be an easy way to share configurations between systems. I currently use Fedora and macOS, these configs are only tested on those systems.  
  
```bash
sudo dnf install git git-delta kitty neovim fira-code-fonts direnv

ln -s ~/source/github.com/dotfiles/bash/.bashrc  ~/
ln -s ~/source/github.com/dotfiles/zsh/.zshrc  ~/
ln -s ~/source/github.com/dotfiles/git/.gitconfig ~/
ln -s ~/source/github.com/dotfiles/git/.gitignore_global ~/
ln -s ~/source/github.com/dotfiles/kitty/kitty.conf ~/.config/kitty/
ln -s ~/source/github.com/dotfiles/editorconfig/.editorconfig ~/source/
ln -s ~/source/github.com/dotfiles/omnisharp/omnisharp.json ~/.omnisharp/
```
  
## [Sublime Merge](https://www.sublimemerge.com/download)
### macOS  
```bash
# link settings file to Library folder.
ln -s ~/source/github.com/dotfiles/smerge/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Merge/Packages/User/
# link executable to folder in PATH
ln -s "/Applications/Sublime Merge.app/Contents/SharedSupport/bin/smerge" ~/.local/bin/
```
### fedora  
```bash
# link settings file to .config folder.
ln -s ~/source/github.com/dotfiles/smerge/Preferences.sublime-settings ~/.config/sublime-merge/Packages/User/
```
  
## .gitconfig_include files  
```
[user]
    email = [email@address.com]
    name = [My Name]
[gpg]
    program = gpg2
[user]
    signingkey = [signingkey]
[commit]
    gpgSign = true
[tag]
    forceSignAnnotated = true
```
  
## set up neovim  
Install `pynvim` with `pip install pynvim`  
- copy nvim files into ~/.config/nvim.  
```
:VimspectorInstall netcoredbg
```
Use [this script](https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh) to test if your terminal supports 24-bit color.  

