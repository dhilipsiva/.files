from os import environ

from fabric.api import run, env, sudo, task, cd
from gitric.api import git_seed, git_reset, allow_dirty

from fabtools import deb, require

env.user = environ['DOTFILES_USER']
env.hosts = environ['DOTFILES_HOST']
allow_dirty = allow_dirty  # Silence flake8

dotfiles_dir = "/home/%s/.files" % env.user


@task
def echo():
    run("echo foo")


@task
def setup():
    """
    run("/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2017.01.02_all.deb keyring.deb SHA256:4c3c6685b1181d83efe3a479c5ae38a2a44e23add55e16a328b8c8560bf05e5f") # NOQA
    sudo("dpkg -i ./keyring.deb")
    sudo('echo "deb http://debian.sur5r.net/i3/ $(grep \'^DISTRIB_CODENAME=\' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list')  # NOQA
    deb.update_index()
    deb.upgrade()
    """
    require.deb.packages(["i3", "lightdm", "xfce4-terminal", "build-essential", "python-pip"])
    # run('sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"')
    sudo("pip install -U pip")
    sudo("pip install powerline-shell tmuxp")
    run("touch private.sh")
    git_seed(dotfiles_dir)
    git_reset(dotfiles_dir)
    with cd(dotfiles_dir):
        run("cp home/.* ~")
    run("brew install gcc")
