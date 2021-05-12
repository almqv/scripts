#!/usr/bin/sh

id="e0d9b784449c6ecee83ac8045630e9a8f7154d332bf6e384f4ce6c6dc23ce498"

data=$(curl -s https://weather.com/weather/today/l/$id?temp=c)
temp=$(echo $data | pup "span.CurrentConditions--tempValue--3KcTQ text{}")
desc=$(echo $data | pup "div.CurrentConditions--phraseValue--2xXSr text{}")

# colors
bold="\e[1m"
reset="\e[0m"

echo -e "Current weather is $bold$desc$reset and $bold$temp$reset C."
