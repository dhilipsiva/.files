def nudown [] {fetch https://api.github.com/repos/nushell/nushell/releases | get assets | select name download_count}
def nuver [] {version | pivot key value}
mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu
source ~/.cache/starship/init.nu

source ~/.files/profile/aliases.nu
source ~/.files/profile/functions.nu
source ~/private.nu
