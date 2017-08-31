source ~/.files/common/profile.sh
if [ "$(uname)" == "Darwin" ]; then
    echo "blah"
else
    source ~/.files/linux/profile.sh
fi

PATH="/home/dhilipsiva/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/dhilipsiva/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/dhilipsiva/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/dhilipsiva/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/dhilipsiva/perl5"; export PERL_MM_OPT;

eval "$(_TMUXP_COMPLETE=source tmuxp)"

