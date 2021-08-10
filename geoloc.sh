#!/usr/bin/zsh

API_URL=http://ip-api.com/batch
IP_FILE=$1

ip_lst="[$(while read ip; do; echo -n "\"$ip\", "; done < $1 | sed 's/..$//')]"
req_data=$(curl -s $API_URL --data $ip_lst)

geo_lst=$(echo $req_data | jq -c '.[] | "\(.country) - \(.city): \(.query)"' | sed 's/\"//g' | uniq | sort)
echo $geo_lst
