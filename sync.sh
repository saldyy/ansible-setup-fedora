# !bin/bash

sync() {
  rsync ./config-files/gitconfig ~/.gitconfig
  rsync ./config-files/tmux.conf ~/.tmux.conf
  rsync ./config-files/zshrc ~/.zshrc

  rsync -av ./config-files/config/sway/ ~/.config/sway/
  rsync -av ./config-files/config/waybar/ ~/.config/waybar/
  rsync -av ./config-files/config/wezterm/ ~/.config/wezterm/

  rsync -av ./neovim-config/ ~/.config/nvim/ 
}

backup() {
  rsync ~/.gitconfig ./config-files/gitconfig 
  rsync ~/.tmux.conf ./config-files/tmux.conf 
  rsync ~/.zshrc ./config-files/zshrc 

  rsync -av ~/.config/sway/ ./config-files/config/sway/
  rsync -av ~/.config/waybar/ ./config-files/config/waybar/
  rsync -av ~/.config/wezterm/ ./config-files/config/wezterm/

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
