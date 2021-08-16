# Easier navigation: .., ..., ...., ....., ~ and -
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..
alias -- = cd -

# Shortcuts

alias :e = nvim  # Somtimes I type this thinking that I am inside vim :P
alias :q = exit
alias :wq = exit
alias be = xargs nvim -p  # Bulk edit by piping filenames
alias c = xclip -select c
alias d = docker
alias dc = docker-compose
alias dm = docker-machine
alias e = nvim
alias ff = firefox
alias g = git
alias h = history
alias la = ls --long
alias p = python
alias pg = postgres -D /home/linuxbrew/.linuxbrew/var/postgres/
alias pos = poetry shell
alias q = exit  # quit
alias rmq = rabbitmq-server
alias sn = shutdown now
alias sudo = 'sudo '
alias y = yarn
