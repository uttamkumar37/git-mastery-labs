# Stash WIP Instructions

This branch is intentionally used for local uncommitted work practice.

Try this:

```bash
printf '\n// local WIP formatter idea\n' >> src/main/java/com/gitmastery/notification/ConsoleNotificationService.java
git status
git stash push -m "wip notification formatter"
git switch main
git switch stash/wip-notification
git stash pop
```
