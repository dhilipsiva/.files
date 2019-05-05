from os import environ

from fabric.api import run, env, sudo, task, cd, settings
from gitric.api import git_seed, git_reset, allow_dirty

from fabtools import deb, require

env.user = environ['DOTFILES_USER']
env.hosts = environ['DOTFILES_HOST']
allow_dirty = allow_dirty  # Silence flake8

home_dir = "/home/%s" % env.user
dot_dir = "%s/.files" % home_dir


@task
def echo():
    run("echo foo")


def wget(cmd):
    run("wget %s" % cmd)


@task
def setup():
    deb.update_index()
    deb.upgrade()
    require.deb.packages([
        "build-essential", "i3", "unzip", "xclip", "curl", "git", "sudo",
        "xdm", "iw", "network-manager", "firmware-atheros", "xfce4-terminal"])
    run('sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"')  # NOQA
    run("touch private.sh")
    git_seed(dot_dir)
    git_reset(dot_dir)
    with cd(dot_dir):
        with settings(warn_only=True):
            run("cp home/.* ~")
            run("cp -R fonts/ ~/.fonts")
            run("fc-cache -rf")
    run("locales")
    run("brew install gcc ruby curl python3 neovim bash bash-completion@2 git pipenv tmux")  # NOQA
    run("pip3 install powerline-shell pwdman hostscli neovim tmuxp")
    sudo("hostscli block_all")
    run("curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim") # NOQA
    run('nvim -c "PlugInstall | q | q"')


'''
Some Use commands for new machine
su -
ip link list
ip link set enp0s20f0u3 up
nmtui
lspci
apt install i3
vi /etc/apt/sources.list
iw config
'''
