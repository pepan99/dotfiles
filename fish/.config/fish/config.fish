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
