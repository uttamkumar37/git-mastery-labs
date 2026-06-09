# Trunk-Based Development

Trunk-based development keeps branches short-lived and integrates frequently into a protected trunk, usually `main`.

## Practices

- Small commits.
- Fast CI.
- Feature flags for incomplete behavior.
- Rebase or merge frequently.
- Avoid long-running branches.

## Git Commands

```bash
git switch main
git pull --rebase
git switch -c feature/tiny-change
# commit
git push -u origin feature/tiny-change
```
