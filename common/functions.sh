function search {
    grep -irl \
        --exclude=\*.{pyc,swp,un~,png,jpg,o} \
        --exclude-dir=".git" \
        --exclude-dir=".cache" \
        --exclude-dir=".tox" \
        --exclude-dir="node_modules" \
        --exclude-dir="bower_components" \
        --exclude-dir="dist" \
        --exclude-dir="tmp" \
        --exclude-dir=".sass-cache" \
        --exclude-dir="Appknox" \
        --exclude-dir="build" \
        --exclude-dir="uploads" \
        --color "$*" .
}

function mkd() {
    mkdir -p "$@" && cd "$@"
}

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
    function diff() {
        git diff --no-index --color-words "$@"
    }
fi

function ak_prs {
    open "https://github.com/pulls?q=is%3Aopen+is%3Apr+user%3Aappknox+label%3Areview"
}

function fix-git {
    git gc --prune=now
    git remote prune origin
}

function _update_ps1() {
    PS1="$(~/powerline-shell.py $? 2> /dev/null)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
