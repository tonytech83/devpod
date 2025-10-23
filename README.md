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
├── local-feature/                   # Custom feature: installs dotfiles
│   ├── devcontainer-feature.json
│   └── install.sh
└── features/                        # Place additional features here (optional)
```

## Quickstart

Prerequisite: DevPod CLI installed (`curl -fsSL https://get.devpod.sh | sh`).

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

## Using the local feature in another project

Add this repository as a feature source in your project's `devcontainer.json` and reference `./local-feature`:
```json
{
  "features": {
    "./local-feature": {}
  }
}
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
