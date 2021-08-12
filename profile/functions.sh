RES=1920x1080
LAP=eDP-1
MON=HDMI-1

function search {
    grep -irl \
        --exclude=\*.{pyc,swp,un~,png,jpg,o} \
        --exclude-dir=".git" \
        --exclude-dir=".venv" \
        --exclude-dir=".cache" \
        --exclude-dir=".tox" \
        --exclude-dir="node_modules" \
        --exclude-dir="bower_components" \
        --exclude-dir="dist" \
        --exclude-dir="tmp" \
        --exclude-dir=".sass-cache" \
        --exclude-dir=".cache-loader" \
        --exclude-dir="build" \
        --exclude-dir="uploads" \
        --exclude-dir=".ropeproject" \
        --exclude-dir="notebooks" \
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

function 2nd {
    awk '{print $2}'
}

function cc(){
	cat $1 | xclip -select c
}

function sm() {
   # Screen Mirrored
   xrandr --output $LAP --mode $RES --output $MON  --primary --mode $RES --same-as $LAP
}

function sb() {
   # Screen Both
   xrandr --output $LAP --mode $RES --output $MON  --primary --mode $RES --left-of $LAP
}

function se () {
    # Screen External
   xrandr --output $LAP --off --output $MON --primary --mode $RES
}

function si () {
    # Screen Internal
   xrandr --output $LAP --primary --mode $RES --output $MON --off
}

function wmx () {
 # Clear watchman inotify error messages
  echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_watches && echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_queued_events && echo 999999 | sudo tee -a /proc/sys/fs/inotify/max_user_instances && watchman shutdown-server
}

function clash_royale (){
    echo "i=1; while [ \$i -le 2 ] ; do input tap 151 1452; sleep 3; input tap 518 1777; sleep 3; done"
}
