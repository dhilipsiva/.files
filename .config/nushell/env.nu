# Nushell Environment Config File
$env.STARSHIP_SHELL = "nu"
$env.STARSHIP_SESSION_KEY = (random chars -l 16)
$env.PROMPT_MULTILINE_INDICATOR = (^/home/linuxbrew/.linuxbrew/bin/starship prompt --continuation)

# Does not play well with default character module.
# TODO: Also Use starship vi mode indicators?
$env.PROMPT_INDICATOR = ""

$env.PROMPT_COMMAND = { ||
    # jobs are not supported
    let width = (term size).columns
    ^/home/linuxbrew/.linuxbrew/bin/starship prompt $"--cmd-duration=($env.CMD_DURATION_MS)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)"
}

# Whether we have config items
let has_config_items = (not ($env | get -i config | is-empty))

$env.config = if $has_config_items {
    $env.config | upsert render_right_prompt_on_last_line true
} else {
    {render_right_prompt_on_last_line: true}
}

$env.PROMPT_COMMAND_RIGHT = { ||
    let width = (term size).columns
    ^/home/linuxbrew/.linuxbrew/bin/starship prompt --right $"--cmd-duration=($env.CMD_DURATION_MS)" $"--status=($env.LAST_EXIT_CODE)" $"--terminal-width=($width)"
}

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR_VI_INSERT = { || ": " }
$env.PROMPT_INDICATOR_VI_NORMAL = { || "〉" }
$env.PROMPT_MULTILINE_INDICATOR = { || "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
$env.ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
