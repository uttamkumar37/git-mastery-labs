# Git Cheatsheet

## Inspect

```bash
git status
git diff
git diff --staged
git log --oneline --graph --decorate --all
git show HEAD
git branch -vv
git remote -v
```

## Commit

```bash
git add README.md
git add -p
git commit -m "feat: add user lookup"
git commit --amend
```

## Branch

```bash
git switch -c feature/example
git switch main
git merge feature/example
git branch -d feature/example
```

## Undo

```bash
git restore file.txt
git restore --staged file.txt
git reset --soft HEAD~1
git reset --mixed HEAD~1
git revert HEAD
git reflog
```

## Remote

```bash
git fetch origin
git pull --rebase
git push -u origin feature/example
git push --force-with-lease
git remote prune origin
```
