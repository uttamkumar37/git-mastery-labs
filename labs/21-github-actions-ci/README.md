# GitHub Actions CI

        ## 1. Concept Explanation

        Run Maven tests on push and pull request.

        ## 2. Commands To Run

        ```bash
        git add .github/workflows/maven-ci.yml
git commit -m "chore: add Maven CI"
git push
        ```

        ## 3. Expected Output Or Expected State

        GitHub Actions runs `mvn test` using Java 17.

        ## 4. Practice Task

        Open a PR and verify the CI check appears.

        ## 5. Common Mistakes

        Skipping local tests because CI exists, or making CI depend on local machine state.

        ## 6. Recovery Commands

        ```bash
        git commit --amend
git push --force-with-lease
        ```

        ## 7. Interview Questions

        - Why should required checks block protected branches?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A PR should not merge unless Maven tests pass.
