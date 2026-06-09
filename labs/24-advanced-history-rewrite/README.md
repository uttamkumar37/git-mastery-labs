# Advanced History Rewrite

        ## 1. Concept Explanation

        Practice safe local rewrites and understand coordination risk.

        ## 2. Commands To Run

        ```bash
        git rebase -i main
git commit --amend
git push --force-with-lease
git filter-repo --help
        ```

        ## 3. Expected Output Or Expected State

        Private history can be improved before review; shared history requires coordination.

        ## 4. Practice Task

        On a disposable branch, reword and squash commits, then inspect reflog.

        ## 5. Common Mistakes

        Using force push on shared branches or rewriting release tags without approval.

        ## 6. Recovery Commands

        ```bash
        git reflog
git reset --hard <sha>
git push --force-with-lease
        ```

        ## 7. Interview Questions

        - Why is force-with-lease safer than force?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A branch contains noisy commits and a wrong commit message before the PR is reviewed.
