# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
    colorflag="--color"
else # OS X `ls`
    colorflag="-G"
fi


# Shortcuts

alias :e="nvim"  # Somtimes I type this thinking that I am inside vim :P
alias :q="exit"
alias :wq="exit"
alias be="xargs nvim -p"  # Bulk edit by piping filenames
alias c='xclip -select c'
alias chat='firefox https://app.slack.com/client/T85P1VD8U/C86PZ86BZ'
alias d="docker"
alias das='tmuxp load das'
alias djeu='tmuxp load djeu'
alias dc="docker-compose"
alias dm="docker-machine"
alias e="nvim"
alias em="ember"
alias f="fuck"
alias ff="firefox"
alias g="git"
alias h="history"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""  # View HTTP traffic
alias iplocal="ipconfig getifaddr en0"
alias ippub="dig +short myip.opendns.com @resolver1.opendns.com"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"
alias l="ls -F ${colorflag}"  # List all files colorized in long format
alias la="ls -aF ${colorflag}"  # List all files colorized in long format, including dot files
alias ll="ls -lahF ${colorflag}"  # List all files with size and colored
alias lsd="ls -F ${colorflag} | grep --color=never '^d'" # List only directories
alias map="xargs -n1"  # find . -name .gitattributes | map dirname
alias os='tmuxp load os'
alias p="python"
alias pg="postgres -D /home/linuxbrew/.linuxbrew/var/postgres/"
alias pos="poetry shell"
alias q="exit"
alias reload="exec $SHELL -l"  # Reload the shell (i.e. invoke as a login shell)
alias rmq="rabbitmq-server"
alias rt='tmuxp load rt'
alias s="scheme"
alias shba="sudo hostscli block-all"
alias shua="sudo hostscli unblock-all"
alias sn="shutdown now"
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"  # View HTTP traffic
alias sudo='sudo '  # Enable aliases to be sudo’ed
alias t="tmux"
alias tf="terraform"
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'  # Stopwatch
alias unite='tmuxp load unite'
alias v="amixer sset 'IEC958' volume"
alias wk="watchman watch-del-all && watchman shutdown-server"  # Kill watchman and loot things
alias y="yarn"

# flatpak aliases
# alias chromium="flatpak run org.chromium.Chromium"
# alias postman="flatpak run com.getpostman.Postman"
# alias slack="flatpak run com.slack.Slack"
# alias teams="flatpak run com.microsoft.Teams"
# alias telegram="flatpak run org.telegram.desktop"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
    alias "$method"="lwp-request -m '$method'"
done
