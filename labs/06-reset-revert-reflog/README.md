# Reset, Revert, And Reflog

        ## 1. Concept Explanation

        Practice undoing local and shared mistakes safely.

        ## 2. Commands To Run

        ```bash
        git reset --soft HEAD~1
git reset --mixed HEAD~1
git reset --hard HEAD~1
git revert HEAD
git commit --amend
git reflog
        ```

        ## 3. Expected Output Or Expected State

        You can explain which commands move refs, which create new commits, and how reflog recovers lost tips.

        ## 4. Practice Task

        Create a disposable branch, make two commits, undo them using different reset modes, then recover with reflog.

        ## 5. Common Mistakes

        Using hard reset on shared work, amending after push without coordination, or forgetting reflog exists.

        ## 6. Recovery Commands

        ```bash
        git reflog
git branch recovered <sha>
git revert -m 1 <merge-sha>
        ```

        ## 7. Interview Questions

        - When should you revert instead of reset?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A bad commit reached `main`; you need to undo it without rewriting shared history.
