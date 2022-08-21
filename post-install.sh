# !bin/bash

# Ensure Docker sock has permission

# chown $USER /var/run/docker.sock

# Install Oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Clone and install fzf

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


