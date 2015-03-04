#!/bin/bash
#Created by Sam Gleske
#A simple script to record the API responses from the gitorious project.
#originally a one liner
#Don't judge me

for x in *.git;do echo $x; curl -s https://gitorious.org/gitorious/${x%.git}.xml > gitorious_api_responses/${x%.git}.xml;done
