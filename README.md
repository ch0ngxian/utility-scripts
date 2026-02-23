# Hey CX!

Opinionated utility toolkit that makes developer life better.

## Installation

```bash
brew install ch0ngxian/heycx/heycx
```

## Commands

### `heycx hotfix start [name]`

Start a new hotfix branch from master.

```bash
$ heycx hotfix start fix-login-bug
✓ Created hotfix/fix-login-bug
```

**What it does:**
- Stashes uncommitted changes (if any)
- Fetches and updates master and develop branches
- Creates `hotfix/<name>` from master
- Re-applies stashed changes

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

### `heycx pr create`

Create a GitHub pull request for the current branch.

```bash
$ heycx pr create
PR title (Fix login bug):
PR description (optional): Fixes the login timeout issue
✓ Created PR #42: Fix login bug
```

**What it does:**
- Auto-detects the base branch (`hotfix/*` → master, `feature/*` → develop, others → prompt)
- Generates a default PR title from the branch name
- Pushes the current branch to remote
- Creates a pull request via `gh`

**Requirements:**
- Must not be on `master` or `develop`
- Requires `gh` (GitHub CLI) to be installed and authenticated

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

### `heycx docker enter <name-part>`

Enter a running Docker container by partial name match.

```bash
$ heycx docker enter api
➜ Entering: my-api-container (abc123)
```

**What it does:**
- Searches running containers for a name matching `<name-part>` (case-insensitive)
- Opens an interactive shell session (tries zsh, then bash, then sh)

## Git Branching Model

These commands assume a Git Flow-style workflow:

- **master** - Production branch
- **develop** - Development branch
- **hotfix/*** - Temporary branches for urgent production fixes

## Dependencies

- **Git** - Required for hotfix and sync commands
- **Docker** - Required for docker-enter command
- **gh** (GitHub CLI) - Optional, used for triggering deployment workflows

## License

MIT
