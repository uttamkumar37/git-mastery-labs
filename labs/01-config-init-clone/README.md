# Config, Init, And Clone

        ## 1. Concept Explanation

        Understand repository creation, cloning, remotes, and how `origin` is configured.

        ## 2. Commands To Run

        ```bash
        git config --list --show-origin
git init scratch-repo
git clone https://github.com/uttamkumar37/git-mastery-labs.git lab-clone
git remote -v
        ```

        ## 3. Expected Output Or Expected State

        A scratch repo has a `.git` directory and the clone has `origin` configured.

        ## 4. Practice Task

        Create a scratch repo, inspect `.git`, then remove the scratch folder.

        ## 5. Common Mistakes

        Running `git init` inside the wrong directory or assuming clone copies only files instead of full history.

        ## 6. Recovery Commands

        ```bash
        pwd
git rev-parse --show-toplevel
rm -rf scratch-repo
        ```

        ## 7. Interview Questions

        - What does `git clone` configure automatically that `git init` does not?
        - Which command in this lab changes history, and which command only inspects history?
        - How would you explain this workflow to a teammate during code review?

        ## 8. Real Project Scenario

        You need to start a service from a template repo and explain whether to clone, fork, or initialize fresh.
