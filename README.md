# Git Mastery Labs

A realistic Java 17 + Maven backend-style project built for hands-on Git practice. The code is intentionally small enough to understand quickly and structured enough to feel like a real service codebase.

## Project Purpose

This repository helps Java developers practice day-to-day and advanced Git workflows using real files, Maven tests, GitHub metadata, CI, release branches, hotfix branches, merge conflicts, rebase exercises, cherry-pick scenarios, stash drills, bisect debugging, Git internals, and team collaboration patterns.

The domain is a dummy in-memory commerce backend with packages:

- `com.gitmastery.user`
- `com.gitmastery.order`
- `com.gitmastery.payment`
- `com.gitmastery.notification`
- `com.gitmastery.common`

No real database, secrets, private keys, tokens, or external services are used.

## How To Clone

```bash
git clone https://github.com/uttamkumar37/git-mastery-labs.git
cd git-mastery-labs
```

## How To Run Tests

```bash
mvn test
```

Run the sample console application:

```bash
mvn -q -DskipTests package
java -cp target/classes com.gitmastery.App
```

## How To Start The Labs

1. Run the test suite on `main`.
2. Read `docs/git-roadmap.md`.
3. Open `labs/00-setup/README.md`.
4. Create the practice branches with:

```bash
bash scripts/create-lab-branches.sh
```

5. Push branches and tags only when you intentionally choose to:

```bash
CONFIRM_PUSH=yes bash scripts/create-lab-branches.sh --push
```

## Recommended Learning Order

1. `labs/00-setup` through `labs/03-branch-checkout-switch`
2. `labs/04-merge-conflicts` through `labs/08-cherry-pick`
3. `labs/09-tags-releases` through `labs/13-blame-log-show-grep`
4. `labs/14-hooks` through `labs/20-git-internals`
5. `labs/21-github-actions-ci` through `labs/25-real-team-scenarios`

## Branch Map

| Branch | Purpose |
| --- | --- |
| `main` | Stable project and all lab documentation. Must compile and pass tests. |
| `develop` | Integration branch for Gitflow practice. |
| `feature/user-api` | User service feature work. |
| `feature/order-api` | Order service feature work. |
| `feature/payment-refactor` | Payment refactoring practice. |
| `feature/notification-service` | Notification feature work. |
| `bugfix/user-null-check` | Small bugfix workflow practice. |
| `hotfix/payment-rounding` | Hotfix branch that fixes the intentionally broken payment calculation. |
| `release/v1.0.0` | Release stabilization branch. |
| `conflict/readme-version-a` | README conflict side A. |
| `conflict/readme-version-b` | README conflict side B. |
| `conflict/user-service-a` | Java method conflict side A. |
| `conflict/user-service-b` | Java method conflict side B. |
| `rebase/messy-history` | Five messy commits for interactive rebase practice. |
| `cherry-pick/source-fixes` | Contains a focused fix to cherry-pick into another branch. |
| `bisect/broken-payment-test` | Contains an intentional payment bug for `git bisect`. |
| `stash/wip-notification` | Contains WIP instructions for stash practice. |
| `revert/bad-feature` | Contains a bad feature commit that should be reverted. |
| `worktree/hotfix-demo` | Worktree-based hotfix practice. |

## Git Command Coverage Table

| Topic | Commands |
| --- | --- |
| Basics | `git config`, `git init`, `git clone`, `git status`, `git add`, `git commit`, `git diff`, `git log`, `git show`, `git rm`, `git mv`, `git restore`, `git checkout`, `git switch` |
| Branching | `git branch`, `git switch -c`, `git merge`, `git branch -d`, `git branch -D`, fast-forward, no-ff, squash merge |
| Remote | `git remote -v`, `git remote add`, `git fetch`, `git pull`, `git pull --rebase`, `git push`, `git push -u`, `git push --force-with-lease`, pruning |
| Undo | `git restore`, `git reset --soft`, `git reset --mixed`, `git reset --hard`, `git revert`, `git commit --amend`, `git reflog` |
| Stash | `git stash`, `git stash push -m`, `git stash list`, `git stash pop`, `git stash apply`, `git stash drop`, `git stash branch`, `git clean` |
| Rebase | `git rebase`, `git rebase main`, `git rebase --continue`, `git rebase --abort`, `git rebase -i`, squash, fixup, reword, edit, drop, autosquash |
| Cherry-pick | `git cherry-pick`, multiple cherry-picks, conflict handling, `--continue`, `--abort` |
| Releases | Lightweight tags, annotated tags, `git tag`, `git show`, tag push/delete, release branches, hotfix branches |
| Debugging | `git bisect`, `git blame`, `git grep`, `git log -p`, `git log --stat`, `git shortlog` |
| Advanced | `git worktree`, `git submodule`, `git subtree`, sparse checkout, partial clone, shallow clone, `git archive`, `git bundle`, `git format-patch`, `git apply`, `git am`, `git request-pull`, `git notes`, `git rerere`, `git gc`, `git fsck`, `git maintenance`, `git cat-file`, `git hash-object`, `git ls-tree`, `git rev-parse`, `git show-ref`, `git update-ref` |

## Safety Notes

- Practice destructive commands only on lab branches, never on protected production branches.
- Prefer `git push --force-with-lease` over `git push --force` when rewriting coordinated history.
- Use `git reflog` before assuming a commit is lost.
- Use `git clean -n` before `git clean -fd`.
- Do not put real secrets into commits. Use fake values only.

## Interview Preparation

Use `docs/interview-questions.md` after each lab. Focus on explaining tradeoffs: merge vs rebase, reset vs revert, local branch vs remote-tracking branch, safe force pushes, conflict resolution, bisect strategy, release tagging, and recovering from mistakes with reflog.
