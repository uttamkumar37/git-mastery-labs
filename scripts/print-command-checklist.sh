#!/usr/bin/env bash
set -euo pipefail

cat <<'CHECKLIST'
Git Mastery Command Checklist
=============================

Basic
-----
git config
git init
git clone
git status
git add
git commit
git diff
git log
git show
git rm
git mv
git restore
git restore --staged
git checkout
git switch

Branching And Merging
---------------------
git branch
git switch -c
git merge
fast-forward merge
no-ff merge
squash merge
merge conflict resolution
conflict markers
git mergetool
git branch -d
git branch -D

Remote
------
git remote -v
git remote add
git fetch
git pull
git pull --rebase
git push
git push -u
git push --force-with-lease
upstream branch
tracking branch
origin/main vs local main
remote branch deletion
pruning remote branches

Undo And Recovery
-----------------
git reset --soft
git reset --mixed
git reset --hard
git revert
git commit --amend
git reflog
recover deleted branch
recover lost commit
undo accidental commit
undo accidental merge
undo accidental rebase

Stash And Cleanup
-----------------
git stash
git stash push -m
git stash list
git stash pop
git stash apply
git stash drop
git stash branch
git clean -n
git clean -fd

Rebase
------
git rebase
git rebase main
git rebase --continue
git rebase --abort
git rebase -i
squash
fixup
reword
edit
drop
autosquash
rebase vs merge
do not rewrite shared history unless coordinated

Cherry-Pick
-----------
git cherry-pick
cherry-pick multiple commits
cherry-pick conflict
git cherry-pick --continue
git cherry-pick --abort

Tags And Releases
-----------------
lightweight tag
annotated tag
git tag
git show tag
git push origin tag
git push --tags
delete local tag
delete remote tag
release branch
hotfix branch

Debugging
---------
git bisect start
git bisect good
git bisect bad
git bisect reset
git blame
git grep
git log --oneline --graph --decorate --all
git log -p
git log --stat
git shortlog

Advanced
--------
git worktree
git submodule
git subtree
git sparse-checkout
partial clone
shallow clone
git archive
git bundle
git format-patch
git apply
git am
git request-pull
git notes
git rerere
git gc
git fsck
git maintenance
git cat-file
git hash-object
git ls-tree
git rev-parse
git show-ref
git update-ref
CHECKLIST
