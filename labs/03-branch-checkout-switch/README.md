# Branch, Checkout, And Switch

        ## 1. Concept Explanation

        Learn modern branch commands and how branch pointers move.

        ## 2. Commands To Run

        ```bash
        git branch
git switch -c feature/practice-branch
git switch main
git checkout feature/practice-branch
git branch -vv
        ```

        ## 3. Expected Output Or Expected State

        A new branch points at the commit where it was created. `branch -vv` shows upstream information when configured.

        ## 4. Practice Task

        Create a branch, make a small commit, then switch back to `main`.

        ## 5. Common Mistakes

        Confusing `checkout` file restore behavior with branch switching, or creating branches from stale `main`.

        ## 6. Recovery Commands

        ```bash
        git switch main
git branch -d feature/practice-branch
git branch -D feature/practice-branch
        ```

        ## 7. Interview Questions

        - Why did Git introduce `switch` and `restore`?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        You need to pause a feature and quickly inspect production code on `main`.
