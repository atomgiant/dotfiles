
alias g='git'

# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'

# Same as above, but in long listing format
alias ll='ls -GFhl'

# Rails
alias r='rails'

# Bundler
alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'

# Postgres
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# Redis
alias redis-start='redis-server /usr/local/etc/redis.conf'

# Misc
alias listening_ports='lsof -i -n -P | grep LISTEN'   # Show which processes are using which ports

# zmv
alias mmv='noglob zmv -W'

# timeclock
alias tc='/Users/tdavies/code/timeclock/timeclock.rb'
alias tct='/Users/tdavies/code/timeclock/timeclock.rb -ts -g 99'
alias tcw='/Users/tdavies/code/timeclock/timeclock.rb -w -g 99'
alias tmr='/Users/tdavies/code/timeclock/timer.rb'
alias tss='/Users/tdavies/code/timeclock/timer.rb start'
alias tsp='/Users/tdavies/code/timeclock/timer.rb stop'
alias ts='/Users/tdavies/code/timeclock/timer.rb status'

# git tag
alias gtag='gtagname=`date -u +"deploy-%Y-%m-%d-%H-%M-%S"`;git tag $gtagname; git push origin $gtagname'
