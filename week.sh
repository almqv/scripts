#!/usr/bin/sh

api_url="https://vecka.nu/"

week=$(curl -s $api_url | pup "time text{}")

echo Week: $week
