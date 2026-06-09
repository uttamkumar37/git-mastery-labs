# Tags And Releases

        ## 1. Concept Explanation

        Practice semantic versioning, annotated tags, lightweight tags, and release branches.

        ## 2. Commands To Run

        ```bash
        git tag
git tag v0.0.1
git tag -a v1.0.0-demo -m "demo release"
git show v1.0.0
git push origin v1.0.0-demo
git push --tags
git tag -d v1.0.0-demo
git push origin :refs/tags/v1.0.0-demo
        ```

        ## 3. Expected Output Or Expected State

        Tags point to release commits and can be inspected or pushed independently.

        ## 4. Practice Task

        Create a local annotated demo tag, inspect it, then delete it.

        ## 5. Common Mistakes

        Retagging published releases casually or using ambiguous version names.

        ## 6. Recovery Commands

        ```bash
        git tag -d <tag>
git push origin :refs/tags/<tag>
        ```

        ## 7. Interview Questions

        - Why are annotated tags preferred for releases?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A release manager needs immutable references for Maven artifact versions.
