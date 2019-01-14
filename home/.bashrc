source ~/.files/common/profile.sh
if [ "$(uname)" == "Darwin" ]; then
    source ~/.files/macOS/profile.sh
else
    source ~/.files/linux/profile.sh
fi

export PATH="/home/dhilipsiva/perl5/bin:$PATH"
export PERL5LIB="/home/dhilipsiva/perl5/lib/perl5:$PERL5LIB"
export PERL_LOCAL_LIB_ROOT="/home/dhilipsiva/perl5:$PERL_LOCAL_LIB_ROOT"
export PERL_MB_OPT="--install_base \"/home/dhilipsiva/perl5\""
export PERL_MM_OPT="INSTALL_BASE=/home/dhilipsiva/perl5"

eval "$(_TMUXP_COMPLETE=source tmuxp)"
