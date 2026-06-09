# Release And Hotfix Workflow

        ## 1. Concept Explanation

        Use release branches, hotfix branches, and tags.

        ## 2. Commands To Run

        ```bash
        git switch release/v1.0.0
git switch hotfix/payment-rounding
mvn test
git tag -a v1.0.1 -m "hotfix release"
        ```

        ## 3. Expected Output Or Expected State

        Release and hotfix changes are isolated from regular feature work.

        ## 4. Practice Task

        Inspect `hotfix/payment-rounding` and compare it to `bisect/broken-payment-test`.

        ## 5. Common Mistakes

        Fixing production issues on random feature branches or forgetting to back-merge hotfixes.

        ## 6. Recovery Commands

        ```bash
        git switch main
git merge hotfix/payment-rounding
        ```

        ## 7. Interview Questions

        - How do you decide between hotfix and normal bugfix?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A production payment bug needs a small audited fix before the next planned release.
