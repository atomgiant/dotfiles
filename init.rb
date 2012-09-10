#!/usr/bin/env ruby

symlinks = {
  # source => target
  './.vimrc' => '~/.vimrc',
  './.gvimrc' => '~/.gvimrc',
  './.zshrc' => '~/.zshrc',
  './.zshenv' => '~/.zshenv',
  './zsh' => '~/.zsh',
}

symlinks.each do |source, target|
  `rm "#{File.expand_path(target)}" 2>&1 /dev/null`
  `ln -s "#{File.expand_path(source)}" "#{File.expand_path(target)}"`
end

