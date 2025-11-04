# Better cat with syntax highlighting
if command -v bat &> /dev/null
    alias cat='bat --style=plain'
    alias catt='bat'
end

# Better grep
if command -v rg &> /dev/null
    alias grep='rg'
end

# Quick navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Dotfiles management
alias dots='cd ~/dotfiles'
alias stowdots='cd ~/dotfiles && stow */'

# Lazygit shortcut
alias lg='lazygit'

# Quick edit common files
alias vimrc='nvim ~/.config/nvim/init.lua'
alias fishrc='nvim ~/.config/fish/config.fish'
alias tmuxrc='nvim ~/.tmux.conf'
alias aerorc='nvim ~/.aerospace.toml'

# Directory listing improvements (you already have eza)
alias l='eza -lah --icons --git'
alias tree='eza --tree --icons'
