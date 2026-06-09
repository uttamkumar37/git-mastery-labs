# Blame, Log, Show, And Grep

        ## 1. Concept Explanation

        Investigate why code exists and how it changed.

        ## 2. Commands To Run

        ```bash
        git blame src/main/java/com/gitmastery/payment/PaymentService.java
git grep "calculateTotal"
git log --oneline --graph --decorate --all
git log -p -- src/main/java/com/gitmastery/payment/PaymentService.java
git log --stat
git shortlog -sn
        ```

        ## 3. Expected Output Or Expected State

        You can trace changes from code line to commit to author intent.

        ## 4. Practice Task

        Find who last changed `calculateTotal` and inspect the patch.

        ## 5. Common Mistakes

        Using blame to assign fault instead of context, or ignoring rename history.

        ## 6. Recovery Commands

        ```bash
        git show <sha>
git log --follow -- <file>
        ```

        ## 7. Interview Questions

        - What is the difference between `git grep` and normal grep in a repo?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        You inherit a service and must understand why a validation rule exists.
