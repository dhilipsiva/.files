# independant vars (Depends on static and builtins)
export DOTFILES_DIR=$HOME/.files
export EDITOR='nvim'
export GOPATH=~/go
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/libs
export PATH=$USER_BIN:$PATH
export SHELL="/home/linuxbrew/.linuxbrew/bin/bash"
export USER_BIN=$HOME/bin
export PYTHONBREAKPOINT=ipdb.set_trace

# 1st Degree Derivatives (Depends only on Independant vars)
export PATH=$GOPATH/bin:$PATH
export TMUXP_CONFIGDIR=$DOTFILES_DIR/.tmuxp
export XDG_CONFIG_HOME=$DOTFILES_DIR/.config

# 2dn Degree Derivatives (Depends on 1st Degree variables)
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"

# utilities
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
