# Stash, Clean, And Restore

        ## 1. Concept Explanation

        Handle interrupted work, generated files, and safe cleanup.

        ## 2. Commands To Run

        ```bash
        git stash push -m "wip notification formatter"
git stash list
git stash apply
git stash pop
git stash drop
git stash branch stash/notification-wip
git clean -n
git clean -fd
        ```

        ## 3. Expected Output Or Expected State

        WIP can be temporarily saved and restored. Untracked generated files are previewed before deletion.

        ## 4. Practice Task

        On `stash/wip-notification`, make a local edit and stash it before switching branches.

        ## 5. Common Mistakes

        Running `git clean -fd` without `-n`, assuming stash is a backup strategy, or popping onto a conflicting branch.

        ## 6. Recovery Commands

        ```bash
        git stash list
git stash show -p stash@{0}
git stash branch recovered-stash stash@{0}
        ```

        ## 7. Interview Questions

        - What is the difference between `stash apply` and `stash pop`?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A production incident interrupts feature work and you must switch branches without losing local changes.
