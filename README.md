# .files
My brand new .files (dotfiles).

## Setup

```
cd ~
git clone git@github.com:dhilipsiva/.files.git
pip3 install tmuxp
cp .files/home.* ~
Install Vim Plug: https://github.com/junegunn/vim-plug
```

## Setup a new ubuntu system

```
cd
git clone git@github.com:dhilipsiva/.files.git
cd .files
cp .env.template .env  # And change the required values
pipenv shell
pipenv install
fab setup
```

# Make i3 touchpad tap to click

First, use `xinput` command to get the name of touchpad. It most probably is a device that has the prefix 'Touchpad' in its name.

For instance, it will be somethine like: `MSFT0001:00 06CB:7E7E Touchpad`

Create a file `/etc/X11/xorg.conf.d/touchpad-tap.conf` with these following contents:

```
Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "Tapping" "on"
EndSection
```
And finally for this config to take place immedietly, run the following command.

```
xinput set-prop "MSFT0001:00 06CB:7E7E Touchpad" "libinput Tapping Enabled" 1
```

