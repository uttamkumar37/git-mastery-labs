# Remotes, Fetch, Pull, And Push

        ## 1. Concept Explanation

        Understand remote-tracking branches and safe synchronization.

        ## 2. Commands To Run

        ```bash
        git remote -v
git remote add upstream <url>
git fetch origin
git pull
git pull --rebase
git push -u origin feature/example
git push --force-with-lease
git push origin --delete feature/example
git remote prune origin
        ```

        ## 3. Expected Output Or Expected State

        `origin/main` updates after fetch; local `main` moves only when merged, rebased, or reset.

        ## 4. Practice Task

        Create a temporary branch, push it with upstream tracking, then delete the remote branch.

        ## 5. Common Mistakes

        Confusing `origin/main` with local `main`, force pushing without lease, or pulling with unknown merge/rebase policy.

        ## 6. Recovery Commands

        ```bash
        git fetch origin
git branch -vv
git remote prune origin
        ```

        ## 7. Interview Questions

        - What is an upstream branch?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        Your local branch is behind remote and push is rejected as non-fast-forward.
