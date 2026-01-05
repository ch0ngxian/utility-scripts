# Useful Utility Scripts

A collection of utility scripts that save time and make life better.

## Purpose

This repository contains automation scripts designed to streamline common development workflows. Currently focused on Git Flow-style hotfix management, these scripts reduce manual steps and save time by automating repetitive tasks that you can leave running while focusing on other work.

## Project Directory

```
scripts/
├── create-hotfix       # Creates a new hotfix branch from master
├── finish-hotfix       # Completes a hotfix by merging to master and develop
├── CLAUDE.md          # Instructions for Claude Code
└── README.md          # This file
```

### Scripts Overview

#### `create-hotfix`
Creates a new hotfix branch with proper branch management and stash handling.

**Features:**
- Stashes uncommitted changes automatically
- Fetches and updates both master and develop branches
- Creates hotfix branch from latest master
- Re-applies stashed changes
- Pushes new branch to remote

**Usage:**
```bash
create-hotfix hotfix/fix-name
```

#### `finish-hotfix`
Completes a hotfix by merging it into master and develop, then cleaning up.

**Features:**
- Merges hotfix into master (with --no-ff)
- Merges master into develop (with --no-ff)
- Pushes both branches to remote
- Triggers production deployment workflow (if available)
- Deletes local and remote hotfix branches

**Usage:**
```bash
finish-hotfix
```

**Requirements:**
- Must be run from a `hotfix/*` branch
- No uncommitted changes allowed
- Requires `gh` CLI for triggering deployment workflows (optional)

## How to Use This Project

### Clone the Repository

```bash
git clone <repository-url> ~/scripts
cd ~/scripts
```

### Source Scripts in Your Shell

Add the scripts directory to your PATH by adding this to your `~/.bashrc` or `~/.zshrc`:

```bash
# Add scripts to PATH
export PATH="$HOME/scripts:$PATH"
```

Then reload your shell configuration:

```bash
# For bash
source ~/.bashrc

# For zsh
source ~/.zshrc
```

Now you can run the scripts from anywhere:

```bash
create-hotfix hotfix/urgent-fix
finish-hotfix
```

## Git Branching Model

These scripts assume a Git Flow-style workflow:

- **master** - Production branch, receives hotfix merges
- **develop** - Development branch, receives master merges after hotfix
- **hotfix/*** - Temporary branches for urgent production fixes

All merges use `--no-ff` to preserve branch history.

## Dependencies

- **Git** - Standard git commands
- **gh** (GitHub CLI) - Optional, used by finish-hotfix to trigger production deployment workflows

## Contributing

Feel free to add new utility scripts to this repository. Follow these guidelines:

1. Make scripts executable: `chmod +x script-name`
2. Include usage documentation in script comments
3. Add colored output for better UX (see existing scripts for examples)
4. Update this README with new script information

## License

These scripts are provided as-is for personal and commercial use.
