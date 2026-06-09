# Patch, Format-Patch, Apply, And Am

        ## 1. Concept Explanation

        Move changes through patch files and email-style workflows.

        ## 2. Commands To Run

        ```bash
        git format-patch main..feature/user-api
git apply --check 0001-*.patch
git apply 0001-*.patch
git am 0001-*.patch
git request-pull main origin feature/user-api
        ```

        ## 3. Expected Output Or Expected State

        Patch files can be reviewed, applied, or imported as commits.

        ## 4. Practice Task

        Create a patch from a small branch and apply it to a temporary branch.

        ## 5. Common Mistakes

        Applying patches without `--check`, losing authorship, or mixing patch formats.

        ## 6. Recovery Commands

        ```bash
        git am --abort
git apply -R <patch>
        ```

        ## 7. Interview Questions

        - What is the difference between `git apply` and `git am`?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A vendor sends a fix as a patch instead of opening a PR.
