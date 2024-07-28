#!/usr/bin/env bash

# Check if a language argument is provided
if [ $# -eq 0 ]; then
  echo "Please provide a language as an argument."
  echo "Usage: newnixenv.sh <language>"
  exit 1
fi

language="$1"
repo_url="https://github.com/the-nix-way/dev-templates"
branch="main"
file_path="${language}/flake.nix"
raw_url="https://raw.githubusercontent.com/the-nix-way/dev-templates/${branch}/${file_path}"

# Check if flake.nix already exists in the current directory
if [ -f "flake.nix" ]; then
  read -p "A flake.nix file already exists in this directory. Do you want to overwrite it? (y/n) " -n 1 -r
  echo # Move to a new line
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Operation cancelled."
    exit 1
  fi
fi

# Fetch the flake.nix file
if curl -f -o "flake.nix" "$raw_url"; then
  echo "Successfully fetched flake.nix for $language"
else
  echo "Failed to fetch flake.nix for $language. Please check if the language is supported."
  exit 1
fi
