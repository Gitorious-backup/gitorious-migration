#!/bin/bash
#Created by Sam Gleske
#originally a one-liner
#crappy one off migration script for gitorious projects.
#Don't judge me

for x in *.git;do
  echo "Migrating ${x%.git}"
  (
    cd $x
    git remote add github $(../create-github-project.rb ${x%.git})
    git push --mirror github
  )
done
echo "Job's done."
