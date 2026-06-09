# GitHub Flow

GitHub Flow keeps `main` deployable. Work happens in short-lived branches and enters `main` through pull requests.

## Steps

```bash
git switch main
git pull --rebase
git switch -c feature/small-change
# edit, test, commit
git push -u origin feature/small-change
```

Open a pull request, request review, pass CI, address comments, then merge.

## Use When

- Releases can happen from `main`.
- Feature flags or small changes keep risk low.
- CI is fast and trusted.
