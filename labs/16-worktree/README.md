# Worktree

        ## 1. Concept Explanation

        Use multiple working directories for parallel branch work.

        ## 2. Commands To Run

        ```bash
        git worktree list
git worktree add ../git-mastery-hotfix worktree/hotfix-demo
git worktree remove ../git-mastery-hotfix
        ```

        ## 3. Expected Output Or Expected State

        A second directory checks out another branch without stashing current work.

        ## 4. Practice Task

        Create a worktree for `worktree/hotfix-demo`, inspect it, then remove it.

        ## 5. Common Mistakes

        Deleting worktree folders manually or checking out the same branch twice.

        ## 6. Recovery Commands

        ```bash
        git worktree prune
git worktree list
        ```

        ## 7. Interview Questions

        - When is worktree better than stash?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        You are reviewing a PR while keeping your current feature branch untouched.
