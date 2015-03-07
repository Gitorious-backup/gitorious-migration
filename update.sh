#!/bin/bash
#Created by Sam Gleske
#originally a one-liner
#Don't judge me
for x in *.git;do (cd $x;git fetch;git push --mirror github);done
