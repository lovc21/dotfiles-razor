# Jakob’s Dotfiles and Programs

[![Ansible CI](https://github.com/lovc21/dotfiles/actions/workflows/ansible-lint.yml/badge.svg?branch=main)](https://github.com/lovc21/dotfiles/actions/workflows/ansible-lint.yml)
[![Ansible Test](https://github.com/lovc21/dotfiles/actions/workflows/ansible-ci.yml/badge.svg)](https://github.com/lovc21/dotfiles/actions/workflows/ansible-ci.yml)
[![secret-scan](https://github.com/lovc21/dotfiles/actions/workflows/secret-scan.yaml/badge.svg)](https://github.com/lovc21/dotfiles/actions/workflows/secret-scan.yaml)

Here, you can find my entire configuration and setup.

> Fully automated, multi-OS development environment setup form scratch.

**Table of Contents**

- [Goal](#goal)
- [Overview](#overview)  
- [Quick Start](#quick-start)  
- [Components](#components)  
- [Inspiration](#inspiration)  
- [License](#license)

## Goal

The goal with my dotfiles is to just run one command and have a new system up and running with no manual setup.

## Overview

This repository is split into multiple components:

- **dot_bootstrap**  
  Ansible playbooks that install system packages, services and prerequisites on Ubuntu, Fedora & macOS.  
- **dot_config**  
  Chezmoi-managed home-directory configuration—shell, editor, GTK, terminal profiles, etc.
- **Scripts**  
  Scripts that are run on every machine startup.

With one command you can bootstrap a fresh machine and apply your complete dotfile configuration.

## Quick Start

Run the following command to bootstrap a fresh machine:

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

## Components

### dot_bootstrap (Ansible)

- **main.yml**: Detects OS and includes roles  
- **roles/**: Per-role tasks, each with `Ubuntu.yml`, `Fedora.yml`, `MacOSX.yml`  
- **requirements/common.yml**: Galaxy collections (e.g. `community.general`)  

Run the bootstrap script:

```bash
  ansible-playbook -i hosts.ini dot_bootstrap/main.yml --connection=local --become --skip-tags=install_apps
```

Or run the run-once scripts:

```bash
  ./run_once_install_ansible.sh
```

### dot_config (Chezmoi)

- **ghostty**, **lazydocker**, **lazygit**: Application configs  
- **nvim/**: LazyVim template, lockfiles, Lua configuration, plugins and settings
- **private_gnome-control-center/**: GNOME Terminal profile backup  

Manage dotfiles with Chezmoi:

```bash
chezmoi diff   # Preview changes
chezmoi apply  # Apply to $HOME
chezmoi apply --dry-run  # Dry run
```

## Inspiration

This repo was inspired by:

- [TechDufus/dotfiles](https://github.com/TechDufus/dotfiles)  
- [logandonley/dotfiles](https://github.com/logandonley/dotfiles)  
- [mkasberg/dotfiles](https://github.com/mkasberg/dotfiles)  
- [kahowell/dotfiles](https://github.com/kahowell/dotfiles)

Thanks to all of you <3

## License

This project is released under the [WTFPL v2](LICENSE).

> DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE  
> Version 2, December 2004
>
> 0. You just DO WHAT THE FUCK YOU WANT TO.
