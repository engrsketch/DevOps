#!/bin/bash
abv=$1

curl https://api.punkapi.com/v2/beers | jq -rc '.[] | {name:.name, abv:.abv}' | sed 's/{"name":/''/g' |sed 's/}/''/g' | sed 's/"abv":/''/g'|sed 's/"/''/g' | awk -F, -v acl="$abv" '$2>acl' | sort -n -t ',' -k2
