# DevPod - Protected Development Environment (PoC)

Proof of concept showing how to spin up a protected DevPod with preinstalled tools (features) and personal dotfiles.

## Overview

What this PoC demonstrates:
- Isolated containerized dev environment
- Preinstalled tools via features
- Dotfiles setup (ZSH + utilities)

## Structure

```
devpod/
├── features                        # Place additional features here (optional)
│   └── kubectl-helm-minikube
├── local-feature                   # Custom feature: installs dotfiles for example
│   ├── devcontainer-feature.json
│   └── install.sh
└── README.md
```

## Quickstart

Prerequisite:
DevPod CLI installed
```sh
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod
```

Clone the this repo
```sh
git clone https://github.com/tonytech83/devpod.git
cd devpod
```

Run the DevPod:
```bash
devpod up . --ide none
```

List, SSH, and delete:
```bash
devpod list
devpod ssh <workspace-name>
devpod delete <workspace-name>
```

## Using the local feature
```json
//...
"postCreateCommand": "bash ./local-feature/install.sh"
//...
```

This runs `local-feature/install.sh`, which installs ZSH, fzf, zoxide, lsd, sets up Oh-My-Posh, and applies dotfiles.

## Notes

- This repo intentionally avoids app code; it only showcases a feature-based setup.
- Extend by adding more features under `features/` or customizing `local-feature/install.sh`.

## Troubleshooting

```bash
devpod logs <workspace-name>
devpod ssh <workspace-name>
```

Resources: https://devpod.sh/docs, https://containers.dev/features
