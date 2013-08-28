#!/usr/bin/env ruby

symlinks = {
  # source => target
  './.vim' => '~/.vim',
  './.vimrc' => '~/.vimrc',
  './.gvimrc' => '~/.gvimrc',
  './.zshrc' => '~/.zshrc',
  './.zshenv' => '~/.zshenv',
  './zsh' => '~/.zsh',
  './.gitconfig' => '~/.gitconfig',
  './.gitignore_global' => '~/.gitignore_global',
  './.ackrc' => '~/.ackrc',
  './.emacs' => '~/.emacs',
  './emacs' => '~/emacs',
  './bin/timeclock.rb' => '~/bin/'
}

symlinks.each do |source, target|
  `rm "#{File.expand_path(target)}" 2>&1 /dev/null`
  `ln -s "#{File.expand_path(source)}" "#{File.expand_path(target)}"`
end

