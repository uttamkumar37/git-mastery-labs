# Feature Branch Workflow

Feature branches isolate work until it is reviewed and ready.

## Commands

```bash
git switch main
git pull --rebase
git switch -c feature/user-api
mvn test
git add src test
git commit -m "feat: add user search"
git push -u origin feature/user-api
```

Keep branches small. Rebase private branches before opening or updating a PR when the team prefers linear history.
