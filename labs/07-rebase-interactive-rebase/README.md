# Rebase And Interactive Rebase

        ## 1. Concept Explanation

        Practice linearizing private history and cleaning messy commits.

        ## 2. Commands To Run

        ```bash
        git switch rebase/messy-history
git rebase main
git rebase -i main
git rebase --continue
git rebase --abort
git commit --fixup <sha>
git rebase -i --autosquash main
        ```

        ## 3. Expected Output Or Expected State

        The messy branch becomes a clean, reviewable sequence of commits.

        ## 4. Practice Task

        Squash five messy commits into two meaningful commits and reword messages.

        ## 5. Common Mistakes

        Rebasing shared branches without coordination, resolving the same conflict repeatedly, or losing test discipline.

        ## 6. Recovery Commands

        ```bash
        git rebase --abort
git reflog
git reset --hard <pre-rebase-sha>
        ```

        ## 7. Interview Questions

        - What is the golden rule of rebase?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A feature branch has noisy WIP commits and needs cleanup before code review.
