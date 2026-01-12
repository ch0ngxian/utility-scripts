# Hey CX!

Opinionated utility toolkit that makes developer life better.

## Installation

```bash
brew install ch0ngxian/heycx/heycx
```

## Commands

### `heycx hotfix start`

Start a new hotfix branch from master.

```bash
$ heycx hotfix start
Enter hotfix name: fix-login-bug
✓ Created hotfix/fix-login-bug
```

**What it does:**
- Stashes uncommitted changes (if any)
- Fetches and updates master and develop branches
- Creates `hotfix/<name>` from master
- Re-applies stashed changes
- Pushes branch to remote

### `heycx hotfix finish`

Complete a hotfix by merging to master and develop.

```bash
$ heycx hotfix finish
✓ Merged hotfix/fix-login-bug → master
✓ Merged master → develop
✓ Pushed master and develop
✓ Deleted hotfix/fix-login-bug
```

**What it does:**
- Merges hotfix into master (with `--no-ff`)
- Merges master into develop (with `--no-ff`)
- Pushes both branches to remote
- Triggers production deployment workflow (if available)
- Deletes local and remote hotfix branches

**Requirements:**
- Must be run from a `hotfix/*` branch
- No uncommitted changes allowed

### `heycx sync`

Update master and develop branches from remote.

```bash
$ heycx sync
✓ Updated master
✓ Updated develop
```

**What it does:**
- Stashes uncommitted changes (if any)
- Fetches and updates master and develop
- Returns to original branch
- Re-applies stashed changes

## Git Branching Model

These commands assume a Git Flow-style workflow:

- **master** - Production branch
- **develop** - Development branch
- **hotfix/*** - Temporary branches for urgent production fixes

## Dependencies

- **Git** - Required
- **gh** (GitHub CLI) - Optional, used for triggering deployment workflows

## License

MIT
