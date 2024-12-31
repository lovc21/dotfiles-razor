#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PLAYBOOK_PATH="~/.bootstrap/main.yml"
INVENTORY_PATH="~/.bootstrap/hosts.ini"

# print error messages in bash
error_exit() {
  echo "Error: $1" >&2
  exit 1
}

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

install_on_fedora() {
  echo "Detected Fedora, installing Ansible using dnf"
  sudo dnf install -y ansible || error_exit "Failed to install Ansible on Fedora."
}

install_on_ubuntu() {
  echo "Detected Ubuntu/Debian, installing Ansible using apt-get"
  sudo apt-get update -y || error_exit "Failed to update package lists on Ubuntu/Debian."
  sudo add-apt-repository --yes --update ppa:ansible/ansible || error_exit "Failed to add Ansible PPA."
  sudo apt-get install -y ansible || error_exit "Failed to install Ansible on Ubuntu/Debian."
}

install_on_mac() {
  echo "Detected macOS."

  if ! command_exists brew; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || error_exit "Failed to install Homebrew."
    # Add Homebrew to PATH for the current session
    eval "$(/opt/homebrew/bin/brew shellenv)" || eval "$(/usr/local/bin/brew shellenv)"
  fi

  echo "Installing Ansible using Homebrew"
  brew install ansible || error_exit "Failed to install Ansible on macOS."
}

install_ansible() {

  if command_exists ansible; then
    echo "Ansible is already installed. Version: $(ansible --version | head -n1)"
    return
  fi

  OS="$(uname -s)"
  case "${OS}" in
  Linux*)
    if [ -f /etc/fedora-release ]; then
      install_on_fedora
    elif [ -f /etc/lsb-release ]; then
      install_on_ubuntu
    else
      echo "Unsupported Linux distribution"
      exit 1
    fi
    ;;
  Darwin*)
    install_on_mac
    ;;
  *)
    echo "Unsupported operating system: ${OS}"
    exit 1
    ;;
  esac

  if command_exists ansible; then
    echo "Ansible installed successfully. Version: $(ansible --version | head -n1)"
  else
    error_exit "Ansible installation failed."
  fi
}
run_playbook() {

  if [ ! -f "${PLAYBOOK_PATH}" ]; then
    error_exit "Ansible playbook not found at ${PLAYBOOK_PATH}."
  fi

  if [ ! -f "${INVENTORY_PATH}" ]; then
    error_exit "Ansible inventory file not found at ${INVENTORY_PATH}."
  fi

  ansible-playbook -i "${INVENTORY_PATH}" "${PLAYBOOK_PATH}" --ask-become-pass || error_exit "Ansible playbook execution failed."

  echo "Ansible playbook executed successfully."
}

# Main script execution
main() {
  install_ansible
  run_playbook
  echo "Ansible setup complete."
}

main
