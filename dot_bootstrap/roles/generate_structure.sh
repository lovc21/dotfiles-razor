#!/usr/bin/env bash
#
# generate_structure.sh
#
# Generates a directory structure for each program, with:
#  - tasks/
#     - Fedora.yml
#     - MacOSX.yml
#     - main.yml
#     - Ubuntu.yml

PROGRAMS=(
  fzf
  git
  go
  helm
  k8s
  lazygit
  lazydocker
  neofetch
  neovim
  npm
  obsidian
  zig
  zoxide
  just
  jq
  yq
  htop
  vim
  zsh
  tmux
  make
  wl-clipboard
  docker
  Jetbrains
  node-typescript
  nodejs
  obs-studio
  pipx
  shellcheck
  tree
  unzip
  wget
  virt-manager
  yamllint
  yubikey-manager
  yubioath-desktop
  dive
  slack
  spotify
  sublime-text
  wallpaper
  system-settings
)

# Create directories and files
for PROG in "${PROGRAMS[@]}"; do
  echo "Creating structure for: ${PROG}"

  # Make the tasks subdirectory
  mkdir -p "${PROG}/tasks"

  # Create Fedora.yml
  cat <<EOF >"${PROG}/tasks/Fedora.yml"
---
# Ansible tasks for ${PROG} on Fedora
EOF

  # Create MacOSX.yml
  cat <<EOF >"${PROG}/tasks/MacOSX.yml"
---
# Ansible tasks for ${PROG} on MacOSX
EOF

  # Create main.yml
  cat <<EOF >"${PROG}/tasks/main.yml"
---
# Main tasks for ${PROG}
EOF

  # Create Ubuntu.yml
  cat <<EOF >"${PROG}/tasks/Ubuntu.yml"
---
# Ansible tasks for ${PROG} on Ubuntu
EOF

done

echo "Done! Directory structure created."
