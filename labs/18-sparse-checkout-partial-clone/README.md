# Sparse Checkout And Partial Clone

        ## 1. Concept Explanation

        Practice large-repo techniques conceptually on a small repo.

        ## 2. Commands To Run

        ```bash
        git clone --depth 1 https://github.com/uttamkumar37/git-mastery-labs.git shallow-lab
git clone --filter=blob:none https://github.com/uttamkumar37/git-mastery-labs.git partial-lab
git sparse-checkout init --cone
git sparse-checkout set src docs
        ```

        ## 3. Expected Output Or Expected State

        Only selected paths are visible in sparse checkout, and shallow clones have limited history.

        ## 4. Practice Task

        Create a disposable sparse checkout clone and inspect visible folders.

        ## 5. Common Mistakes

        Using shallow clones for release audits that need full history.

        ## 6. Recovery Commands

        ```bash
        git sparse-checkout disable
git fetch --unshallow
        ```

        ## 7. Interview Questions

        - What problem does partial clone solve?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        A monorepo is too large for every developer to check out fully.
