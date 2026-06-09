# Git Troubleshooting

## Non-Fast-Forward Push Rejected

```bash
git fetch origin
git log --oneline --graph --decorate --all
git pull --rebase
git push
```

If you intentionally rewrote your private branch:

```bash
git push --force-with-lease
```

## Accidental Commit On Wrong Branch

```bash
git branch rescue/my-work
git switch correct-branch
git cherry-pick rescue/my-work
```

## Lost Commit

```bash
git reflog
git branch recovered-work <sha>
```

## Merge Conflict

```bash
git status
# edit files to remove conflict markers
git add <resolved-file>
git merge --continue
```

## Clean Build But Dirty Working Tree

```bash
git status --short
git clean -n
git clean -fd
```
