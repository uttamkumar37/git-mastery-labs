# Merge Conflicts

        ## 1. Concept Explanation

        Create and resolve conflicts in README and Java methods.

        ## 2. Commands To Run

        ```bash
        git switch main
git merge conflict/readme-version-a
git merge conflict/readme-version-b
git status
git mergetool
git add README.md
git merge --continue
        ```

        ## 3. Expected Output Or Expected State

        Conflict markers are removed and the resolved file contains the intended final content.

        ## 4. Practice Task

        Merge the two README conflict branches in a temporary branch and resolve by keeping both useful changes.

        ## 5. Common Mistakes

        Deleting one side blindly, committing conflict markers, or resolving without running tests.

        ## 6. Recovery Commands

        ```bash
        git merge --abort
git restore --ours README.md
git restore --theirs README.md
        ```

        ## 7. Interview Questions

        - What do `<<<<<<<`, `=======`, and `>>>>>>>` mean?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        Two developers edit the same validation method in `UserService` and CI must stay green after resolution.
