# About this crappy project

This is a quick set of one off migrate scripts used to preserve Gitorious in all
of its AGPL goodness.  [Gitorious was bought by GitLab][gitorious-aquisition].
As a result my knee jerk reaction was to preserve the current Gitorious code
base.

This is simply a GitHub mirror of the Gitorious project as of 3/4/2015.  Please
note, these scripts are shitty so prepare for your eyes to bleed.

Have fun looking at the crappy source.  It got the job done.

The order in which the migration was run relative to the root of this
repository.

    ./clone.sh
    ./migrate.sh
    ./api_responses.sh

Please note that `refs/merge-requests/*` has been preserved on all repositories.
A quick summary of the git commands used to perform the mirroring.

    git clone --mirror <gitorious-project>
    cd <gitorious-project>
    git remote add github <github-project>
    git push --mirror github

That's about it.

[gitorious-aquisition]: https://about.gitlab.com/2015/03/03/gitlab-acquires-gitorious/
