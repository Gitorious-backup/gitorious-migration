#!/bin/bash
#created by Sam Gleske
#this was originally a one liner
#this is a one off hack script to quickly clone all gitorious projects
#Don't judge me

curl https://gitorious.org/gitorious.xml -s | grep clone_url | sed 's# *<clone_url>\([^<]*\)</clone_url>#\1#' | while read x;do git clone --mirror $x;done
