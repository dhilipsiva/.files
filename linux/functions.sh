function cc(){
	cat $1 | xclip -select c
}

RES=1920x1080
LAP=eDP-1
MON=HDMI-1

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
