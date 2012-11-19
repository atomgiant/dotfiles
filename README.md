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
### NOTE: You MUST use ruby 1.8.7 for this step
```
cd DOTFILES_HOME/.vim/bundle/command-t/ruby/command-t
bundle install
ruby extconf.rb
make
```

## Set zsh as default shell
```
chsh -s /bin/zsh
```

