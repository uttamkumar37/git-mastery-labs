# Bisect Debugging

        ## 1. Concept Explanation

        Use tests to find a regression commit automatically.

        ## 2. Commands To Run

        ```bash
        git switch bisect/broken-payment-test
git bisect start
git bisect bad
git bisect good main
git bisect run mvn -q test
git bisect reset
        ```

        ## 3. Expected Output Or Expected State

        Bisect identifies the commit that broke payment calculation.

        ## 4. Practice Task

        Run bisect on the broken payment branch and record the bad commit SHA.

        ## 5. Common Mistakes

        Marking the wrong good commit, using flaky tests, or forgetting `git bisect reset`.

        ## 6. Recovery Commands

        ```bash
        git bisect reset
git switch main
        ```

        ## 7. Interview Questions

        - How does binary search reduce the number of commits to inspect?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A payment rounding regression appears and nobody remembers which commit caused it.
