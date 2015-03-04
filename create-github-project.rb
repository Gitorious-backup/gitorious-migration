#!/usr/local/bin/ruby
#Created by Sam Gleske
#crappy ruby script for checking if a repository exists in Github
#if it doesn't then create it using the Gitorious description.
#This is meant to be a simple hack to quickly migrate gitorious projects to a gitorious org on GitHub
#Don't judge me

require 'json'
require 'rexml/document'
include REXML

def description(project)
  xmlfile=`curl -s https://gitorious.org/gitorious/#{project}.xml`
  xmldoc = Document.new(xmlfile)
  xmldoc.root.elements["description"].text
end


#check if repo exists
result=`curl -s -H 'Content-Type: application/json' -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: token #{ENV['GITHUB_TOKEN']}' https://api.github.com/repos/gitorious-backup/#{ARGV[0]}`
repo=JSON.parse(result)
if repo["ssh_url"]
  #if exists then don't bother creating it, just print clone URL
  print repo["ssh_url"]
else
  #used for creating the github project
  github_json = {
    :name => ARGV[0],
    :description => description(ARGV[0]),
    :homepage => "https://gitorious.org/gitorious/#{ARGV[0]}",
    :has_issues => false,
    :has_wiki => false
    }

  result=`curl -s -H 'Content-Type: application/json' -H 'Accept: application/vnd.github.v3+json' -H 'Authorization: token #{ENV['GITHUB_TOKEN']}' --request POST --data '#{JSON.generate(github_json)}' https://api.github.com/orgs/gitorious-backup/repos`
  repo=JSON.parse(result)
  print repo["ssh_url"]
end
