export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# Sources
test -f "$HOME/.zshenv.private" && source "$HOME/.zshenv.private"

# Pnpm
export PNPM_HOME="${PNPM_HOME:-$XDG_DATA_HOME/pnpm}"

# PATH
typeset -U path PATH
path=($PNPM_HOME $path)
