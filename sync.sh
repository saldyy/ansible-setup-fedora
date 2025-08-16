# !bin/bash

sync() {
  rsync ./config-files/gitconfig ~/.gitconfig
  rsync ./config-files/tmux.conf ~/.tmux.conf
  rsync ./config-files/zshrc ~/.zshrc
}

backup() {
  rsync ~/.gitconfig ./config-files/gitconfig 
  rsync ~/.tmux.conf ./config-files/tmux.conf 
  rsync ~/.zshrc ./config-files/zshrc 
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
