# Git Command Index

## Basic Commands

- `git config`: set user, editor, aliases, pull strategy, and rerere.
- `git init`: create a repository.
- `git clone`: copy a repository and configure `origin`.
- `git status`: inspect working tree and index state.
- `git add`: stage changes.
- `git commit`: create a commit from staged changes.
- `git diff`: compare working tree, index, commits, and branches.
- `git log`: inspect history.
- `git show`: inspect one object or commit.
- `git rm`: remove a tracked file.
- `git mv`: rename or move a tracked file.
- `git restore`: discard or unstage changes.
- `git checkout`: legacy branch/file switching command.
- `git switch`: modern branch switching command.

## Branching And Merging

- `git branch`: list, create, delete, and rename branches.
- `git switch -c`: create and switch to a branch.
- `git merge`: combine histories.
- `git mergetool`: resolve conflicts using a configured tool.
- `git branch -d`: delete a safely merged branch.
- `git branch -D`: force delete an unmerged branch.

## Remote Commands

- `git remote -v`, `git remote add`, `git fetch`, `git pull`, `git pull --rebase`, `git push`, `git push -u`, `git push --force-with-lease`.
- Understand upstream branch, tracking branch, `origin/main` vs local `main`, remote branch deletion, and pruning remote branches.

## Recovery Commands

- `git reset --soft`, `git reset --mixed`, `git reset --hard`, `git revert`, `git commit --amend`, `git reflog`.
- Recover deleted branches, lost commits, accidental commits, accidental merges, and accidental rebases.

## Advanced Commands

- `git worktree`, `git submodule`, `git subtree`, `git sparse-checkout`, shallow clone, partial clone, `git archive`, `git bundle`, `git format-patch`, `git apply`, `git am`, `git request-pull`, `git notes`, `git rerere`, `git gc`, `git fsck`, `git maintenance`, `git cat-file`, `git hash-object`, `git ls-tree`, `git rev-parse`, `git show-ref`, `git update-ref`.
