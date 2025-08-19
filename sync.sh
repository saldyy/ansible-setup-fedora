# !bin/bash

sync() {
  rsync ./config-files/gitconfig ~/.gitconfig
  rsync ./config-files/tmux.conf ~/.tmux.conf
  rsync ./config-files/zshrc ~/.zshrc

  rsync -r ./config-files/config/sway ~/.config/sway
  rsync -r ./config-files/config/polybar ~/.config/polybar
  rsync -r ./config-files/config/wezterm ~/.config/wezterm

  rsync -av ./neovim-config/ ~/.config/nvim/ 
}

backup() {
  rsync ~/.gitconfig ./config-files/gitconfig 
  rsync ~/.tmux.conf ./config-files/tmux.conf 
  rsync ~/.zshrc ./config-files/zshrc 

  rsync -r ~/.config/sway/ ./config-files/config/sway
  rsync -r ~/.config/polybar ./config-files/config/polybar
  rsync -r ~/.config/wezterm ./config-files/config/wezterm

  rsync -av ~/.config/nvim/ ./neovim-config/
}

# Main logic: check argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 {config|backup}"
    exit 1
fi

case $1 in
    config)
        echo "Syncing config files..."
        sync
        ;;
    backup)
        echo "Backing up config files..."
        backup
        ;;
esac

echo "Done."
