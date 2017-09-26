# independant vars (Depends on static and builtins)
export DOTFILES_DIR=$HOME/.files
export EDITOR='nvim'
export GOPATH=~/go/
export PATH=/usr/local/bin:$PATH

# 1st Degree Derivatives (Depends only on Independant vars)
export PATH=$GOPATH/bin:$PATH
export TMUXP_CONFIGDIR=$DOTFILES_DIR/.tmuxp
export XDG_CONFIG_HOME=$DOTFILES_DIR/.config

# 2dn Degree Derivatives (Depends on 1st Degree variables)
export INPUTRC=$XDG_CONFIG_HOME/readline/inputrc
