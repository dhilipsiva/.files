RES=1920x1080
LAP=eDP-1
MON=HDMI-1

def search [q] {
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
        --color "$q" .
}

def mkd [folder] {
    mkdir "$folder" && cd "$folder"
}

def 2nd [] {
    awk "{print $2}"
}

def cc [data] {
	cat $data | xclip -select c
}

def sm [] {
   # Screen Mirrored
   xrandr --output $nu.env.LAP --mode $nu.env.RES --output $nu.env.MON  --primary --mode $nu.env.RES --same-as $nu.env.LAP
}

def sb [] {
   # Screen Both
   xrandr --output $nu.env.LAP --mode $nu.env.RES --output $nu.env.MON  --primary --mode $nu.env.RES --left-of $nu.env.LAP
}

def se [] {
    # Screen External
   xrandr --output $nu.env.LAP --off --output $nu.env.MON --primary --mode $nu.env.RES
}

def si [] {
    # Screen Internal
   xrandr --output $nu.env.LAP --primary --mode $nu.env.RES --output $nu.env.MON --off
}


def clash_royale [] {
    echo "i=1; while [ \$i -le 2 ] ; do input tap 151 1452; sleep 3; input tap 518 1777; sleep 3; done"
}
