# Pull Requests And Code Review

        ## 1. Concept Explanation

        Practice review-ready commits, PR templates, draft PRs, and CODEOWNERS.

        ## 2. Commands To Run

        ```bash
        git switch -c feature/review-demo
git commit -m "feat: add review demo"
git push -u origin feature/review-demo
        ```

        ## 3. Expected Output Or Expected State

        A PR has a clear summary, linked issue, tests, and reviewer notes.

        ## 4. Practice Task

        Open a draft PR using `.github/pull_request_template.md` and request review.

        ## 5. Common Mistakes

        Large PRs, missing tests, ignoring review comments, or bypassing required checks.

        ## 6. Recovery Commands

        ```bash
        git commit --amend
git push --force-with-lease
        ```

        ## 7. Interview Questions

        - What should be in a strong PR description?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A team requires CODEOWNERS approval before changes under `src/` merge.
