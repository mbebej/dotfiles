# dotfiles  
This repository is for my own personal set up. This is only intended to work for me and to be an easy way to share configurations between systems. I currently use Fedora and macOS, these configs are only tested on those systems.  

```  
sudo dnf install git git-delta kitty neovim tmux fira-code-fonts   

ln -s ~/source/github.com/dotfiles/bash/.bashrc  ~/  
ln -s ~/source/github.com/dotfiles/zsh/.zshrc  ~/  
ln -s ~/source/github.com/dotfiles/tmux/.tmux.conf ~/  
ln -s ~/source/github.com/dotfiles/git/.gitconfig ~/  
ln -s ~/source/github.com/dotfiles/git/.gitignore_global ~/  
ln -s ~/source/github.com/dotfiles/kitty/kitty.conf ~/.config/kitty/  
```  
  
## .gitconfig_include files  
```  
[user]  
    email = email@address.com  
    name = My Name  
```  
  
## set up neovim  
```  
pip install pynvim  
```  
- copy nvim files into ~/.config/nvim.  
- `:GoInstallBinaries` will be run automatically at initial set up.  
- `:GoUpdateBinaries` will need to be run after go updates.  
```  
:CocInstall coc-go coc-tsserver coc-svelte  
:VimspectorInstall vscode-go  
```  
