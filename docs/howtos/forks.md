# How to Fork an Upstream Project

In some cases we want to fork an existing Project (usually git based), partly
because we want to fix and implement things which can be up-streamed later on or
for DBP specific changes that will stay around forever.

Our goals are:

* We want our changes to be in a format suitable for upstreaming, so separate
  commits for separate changes.
* We want a linear history so it's clearly visible which changes we added on top.
* We want updating to a new upstream release to be easy.
* We want reverting to a previous release to be easy in case the rebase step
  introduced an error.


## How to represent our changes in the git fork

We want to create a local git clone which has two remotes, the upstream
git server and our own git server. We want to have a branch including
our changes based on some upstream release tag and want to push that to
our own git server.

-   Clone the upstream repo: `git clone <upstream-url>`
-   Rename the upstream remote from "origin" to "upstream":
    `git remote rename origin upstream`
-   Create a new repo in gitlab
-   Add the new repo as the new "origin" remote:
    `git remote add origin <gitlab-url>`
-   Checkout the release tag of the upstream project:
    `git checkout v1.2.3`
-   Create a new branch based on the tag which includes our changes:
    `git checkout -b dbp-v1.2.3`
-   Add our changes: `git commit <...>`
-   Push our branch with our changes on top of the upstream release to
    our gitlab: `git push --set-upstream origin dbp-v1.2.3`

## How to incorporate updates on new upstream releases

This assumes your local git clone has two remotes, `origin` pointing to the
fork, `upstream` pointing to upstream. Check with `git remote -v`.

In case upstream creates a new release and pushes a new tag we want to
get the new code, create a new branch based on this new release and copy
our changes to this new branch. The old branch remains so we can easily
roll back in case something no longer works.

-   Fetch all new things from all remotes: `git fetch --all`
-   Checkout the new release tag: `git checkout v1.2.4`
-   Create a new branch for us based on this new tag:
    `git checkout -b dbp-v1.2.4`
-   Copy all commits we made on the "dbp-v1.2.3" branch to this new
    branch: `git cherry-pick v1.2.3..dbp-v1.2.3`
-   Push the new branch to our gitlab: `git push --set-upstream origin dbp-v1.2.4`

!!! note
    In case cherry picking gets too complicated because some commits are now
    included in the new release and should ideally be skipped you can also
    use `git format-patch` and `git am`:

    -   `git checkout dbp-v1.2.3`
    -   `git format-patch v1.2.3` -\> this creates various patch files in
        the current directory
    -   `git checkout dbp-v1.2.4`
    -   Call `git am <patch-files..>` on all files or one at a time. You can
        pass `-3` to enable three-way merges if basic
        `am` fails.

## How to tag internal releases

In case we want to "release" our fork, in that the OPs team wants to deploy and
we have to tell them a specific tag to check out, we use the following tag
format:

* `dbp-2020-12-24`
* `dbp-2020-12-24-v2` (in case there are multiple releases on the same date)

We prefix the tag with `dbp-` to avoid conflicts with upstream tagging schemes and use date based tags because it's simple.