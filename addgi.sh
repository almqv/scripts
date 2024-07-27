#!/usr/bin/env bash

# Fetch the gitignore template from github and output it to the terminal
curl -sLw "\n" https://www.gitignore.io/api/$1
