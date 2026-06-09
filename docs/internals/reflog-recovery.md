# Reflog Recovery

The reflog records movements of refs such as `HEAD` and branches.

```bash
git reflog
git branch recovered <sha>
git switch recovered
```

Use reflog to recover from accidental reset, deleted branches, failed rebase, and commits made on the wrong branch.
