if status is-interactive
    bind \cf 'tmux-sessionizer'
    # Commands to run in interactive sessions can go here
end

# pnpm
set -gx PNPM_HOME "/home/pepan/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

set -x LAUNCH_EDITOR launch_editor_script

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Set-up icons for files/folders in terminal using eza
function ls
  eza -a --icons $argv
end

function ll
  eza -al --icons $argv
end

function lt
  eza -a --tree --level=1 --icons $argv
end

function v
  nvim $argv
end

function v.
  nvim . $argv
end

function tmux-sessionizer
  ~/.local/bin/tmux-sessionizer $argv
end

function ta
  tmux a
end

set -Ux DOTNET_ROOT /usr/local/share/dotnet
set -Ux PATH $DOTNET_ROOT $PATH

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/josefkrusina/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
