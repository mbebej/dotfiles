# dotfiles  
```  
ln -s ~/source/github.com/dotfiles/tmux/.tmux.conf  
ln -s ~/source/github.com/dotfiles/zsh/.zshrc  
ln -s ~/source/github.com/dotfiles/git/.gitconfig  
ln -s ~/source/github.com/dotfiles/git/.gitignore_global  
```  
  
## .gitconfig_include files  
```  
[user]  
    email = email@address.com  
    name = My Name  
```  
  
## set up nvim  
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