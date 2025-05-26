# Dotfiles and programs I use on my PC

Here, you can find my entire configuration and setup.

## Goal

The goal with my dotfiles is to just run one command and have a new system up and running with no manual setup.

## Run this command to bootstrap your setup

### Ubuntu

```bash
export GITHUB_USERNAME=lovc21; sudo apt update && sudo apt install -y git curl && sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh $GITHUB_USERNAME
```

### Fedora

```bash
export GITHUB_USERNAME=lovc21; sudo dnf install -y git curl; sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh $GITHUB_USERNAME
```

### MacOS

```bash
export GITHUB_USERNAME=lovc21; /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; brew install git curl; sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --ssh $GITHUB_USERNAME
```
