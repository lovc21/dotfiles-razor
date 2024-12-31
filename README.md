# My dotfiles (using Ansible and Chezmoi, maybe Nix Home Manager in the future)

Here, you can find my entire configuration and setup. To get started, run this command in your terminal:

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
