dotfiles
========

All my local configuration goodness - VIM, shell, etc

## First run the following to setup symlinks

```
./init.rb
```

## Now setup the submodules
```
git submodule init
git submodule update
```

## Next to setup Command-T, run the following
```
cd ~/.dotfiles/.vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make
```

## Set zsh as default shell
```
chsh -s /bin/zsh
```

