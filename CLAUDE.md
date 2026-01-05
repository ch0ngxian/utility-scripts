# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This repository contains Git workflow automation scripts for managing hotfix branches in a Git Flow-style workflow with `master` and `develop` branches.

## Architecture

### Hotfix Workflow

The repository implements a two-script hotfix workflow:

1. **create-hotfix** - Creates a new hotfix branch from master
   - Stashes any uncommitted changes
   - Fetches and updates both master and develop branches
   - Creates hotfix branch (must be named `hotfix/*`)
   - Applies stashed changes back
   - Pushes new branch to remote

2. **finish-hotfix** - Completes a hotfix by merging it back
   - Merges hotfix into master (with --no-ff)
   - Merges master into develop (with --no-ff)
   - Pushes both branches to remote
   - Triggers production deployment workflow (searches for workflow matching "prod" + "deployment" keywords)
   - Deletes local and remote hotfix branches

### Git Branching Model

- **master** - Production branch, receives hotfix merges
- **develop** - Development branch, receives master merges after hotfix
- **hotfix/*** - Temporary branches for urgent production fixes

All merges use `--no-ff` to preserve branch history.

## Common Commands

### Creating a Hotfix

```bash
./create-hotfix hotfix/fix-name
```

This is an interactive script that will:
- Show what actions will be performed
- Ask for confirmation before proceeding
- Handle stashing/unstashing of uncommitted changes automatically

### Finishing a Hotfix

```bash
./finish-hotfix
```

Requirements:
- Must be run from a `hotfix/*` branch
- No uncommitted changes allowed (will fail with error)
- Requires `gh` CLI for triggering deployment workflows

## Script Dependencies

- **Git** - All standard git commands
- **gh** (GitHub CLI) - Used by finish-hotfix to trigger production deployment workflows
  - If gh is not available or workflow not found, script continues without triggering deployment

## Important Patterns

### Error Handling

Both scripts use `set -e` to exit immediately on errors. This means:
- Any failed git command will stop the script
- Merge conflicts require manual resolution
- The scripts will not continue past failures

### User Confirmation

create-hotfix shows all planned actions and requires user confirmation (`y/N`) before proceeding.

### Workflow Triggering

finish-hotfix searches for a production deployment workflow using:
```bash
gh workflow list | grep -i "prod" | grep -i "deployment"
```

If found, it triggers the workflow on the master branch. If not found or gh unavailable, the script continues without error.
