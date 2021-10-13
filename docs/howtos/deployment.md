# Auto-Deployment with GitLab & Deployer

-   Each git repo has different deployment environments. Each
    environment is a list basically of servers where the same code is
    deployed to. Usually "development", "test", "demo",
    "staging", "production" etc.
-   The "master" branch always gets deployed to "development". The
    "test" branch gets deployed to "test" etc.

## Example Deployment Flow for a "test" deployment

-   We commit code and push it to the "test" branch
-   A GitLab runner gets started which contains <https://deployer.org/>
    and makes itself ready for connecting per SSH to the target servers.
-   The runner executes "deployer" for the "test" stage
-   "deployer" executes the deployment tasks for all hosts and tasks
    matching the "test" stage.
-   Done

## How to set up a new deployment environment

-   A new "test" branch which is marked "protected"
-   A GitLab CI job which only runs for new commits on the "test"
    branch and can run "deployer"
-   A "deployer" stage named "test" which when run from the gitlab
    runner does everything needed to get the code to the server,
    configure everything, restarts services, clears caches etc.
-   Gitlab CI variables which are targeted at the "test" environment
    and are "protected" for secrets used during deployment.

See <https://gitlab.tugraz.at/dbp/middleware/esign/pdf-as-server-qualified> for a
good example which uses multiple deployment environments and multiple
hosts per environment.

## How to prepare a server for SSH deployment

- Run `ssh-keygen` (set filename to 'mykey', no password)
- This creates 'mykey' and 'mykey.pub' in the current directory
- Rename the `user@hostname` part in 'mykey.pub' to indicate what the key is used for, for example 'gitlab-deployment-key'
- Run `ssh-copy-id -i mykey serveruser@someserver.tugraz.at` (the key
  is now in \~/.ssh/authorized\_keys on the server)
- Put the content of 'mykey' into gitlab
