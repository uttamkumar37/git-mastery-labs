# Reset vs Revert vs Restore

## Restore

Use `git restore` to discard working tree changes or unstage files.

```bash
git restore README.md
git restore --staged README.md
```

## Reset

Use `git reset` to move a branch ref. This rewrites local history.

```bash
git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1
```

## Revert

Use `git revert` to create a new commit that undoes another commit. This is safe for shared branches.

```bash
git revert HEAD
```
