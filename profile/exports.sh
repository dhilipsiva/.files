# independant vars (Depends on static and builtins)
export DOTFILES_DIR=$HOME/.files
export EDITOR='nvim'
export FZF_COMPLETION_OPTS='+c -x'
export FZF_COMPLETION_TRIGGER='~~'
export GOPATH=~/go
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/libs:/home/linuxbrew/.linuxbrew/opt/python@3.8/lib
export NVM_DIR="$HOME/.nvm"
export PATH="$HOME/.cargo/bin:/home/linuxbrew/.linuxbrew/bin:$PATH"
export PIPENV_VENV_IN_PROJECT=1
export PYTHONBREAKPOINT=ipdb.set_trace
export SHELL="/home/linuxbrew/.linuxbrew/bin/bash"
export USER_BIN=$HOME/bin
export PATH=$HOME/bin/AppFlowy:$PATH
export PATH=$HOME/bin/firefox:$PATH

# 1st Degree Derivatives (Depends only on Independant vars)
export PATH=$GOPATH/bin:$PATH
export PATH=$USER_BIN:$PATH
export STARSHIP_CONFIG=$DOTFILES_DIR/starship.toml
export TMUXP_CONFIGDIR=$DOTFILES_DIR/.tmuxp
export XDG_CONFIG_HOME=$DOTFILES_DIR/.config
export ZELLIJ_CONFIG_DIR=$XDG_CONFIG_HOME/zellij/config.yaml

# 2dn Degree Derivatives (Depends on 1st Degree variables)
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
export XDG_DATA_DIRS="/home/linuxbrew/.linuxbrew/share:$XDG_DATA_DIRS"
