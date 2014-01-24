dotfiles
========

All my local configuration goodness - VIM, shell, etc

## First run the following to setup symlinks

```
./init.rb
```

## Install vundle
```
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
```

## Set zsh as default shell
```
chsh -s /bin/zsh
```

## Fire up mvim and run and run the following:

### Install vundle plugins
```
:BundleInstall
```

### Rebuild help tags
```
:Helptags
```
