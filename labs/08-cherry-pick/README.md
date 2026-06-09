# Cherry-Pick

        ## 1. Concept Explanation

        Move selected commits without merging a whole branch.

        ## 2. Commands To Run

        ```bash
        git switch main
git switch -c practice/cherry-pick
git cherry-pick cherry-pick/source-fixes
git cherry-pick <sha1> <sha2>
git cherry-pick --continue
git cherry-pick --abort
        ```

        ## 3. Expected Output Or Expected State

        Only selected fixes appear on the target branch.

        ## 4. Practice Task

        Cherry-pick the focused fix from `cherry-pick/source-fixes` into a temporary branch.

        ## 5. Common Mistakes

        Cherry-picking duplicate changes, ignoring conflicts, or losing original context.

        ## 6. Recovery Commands

        ```bash
        git cherry-pick --abort
git reset --hard HEAD~1
        ```

        ## 7. Interview Questions

        - How is cherry-pick different from merge?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A bugfix is needed in a release branch but the feature branch contains unrelated work.
