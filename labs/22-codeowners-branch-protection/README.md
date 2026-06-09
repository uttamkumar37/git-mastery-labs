# CODEOWNERS And Branch Protection

        ## 1. Concept Explanation

        Practice ownership and protected branch concepts.

        ## 2. Commands To Run

        ```bash
        cat .github/CODEOWNERS
git branch -vv
        ```

        ## 3. Expected Output Or Expected State

        CODEOWNERS routes reviews and branch protection prevents unsafe direct pushes.

        ## 4. Practice Task

        Inspect CODEOWNERS and design branch protection rules for `main`.

        ## 5. Common Mistakes

        Assuming CODEOWNERS works without branch protection or required reviews.

        ## 6. Recovery Commands

        ```bash
        git push origin --delete <branch>
git branch -d <branch>
        ```

        ## 7. Interview Questions

        - How do CODEOWNERS and required status checks complement each other?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A platform team must approve workflow changes under `.github/workflows/`.
