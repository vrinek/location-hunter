source config.fish
source secrets.fish

echo "Getting page 1..."

curl -s "https://places.cit.api.here.com/places/v1/discover/search\
?at=$LATITUDE%2C$LONGITUDE\
&q=$HERE_SEARCH_QUERY\
&app_id=$HERE_APP_ID&app_code=$HERE_APP_CODE" | jq -r '.results' > tmp/places-from-here-maps-1.json

set page 1

set next_link (cat tmp/places-from-here-maps-1.json | jq -r '.next')

while test $next_link != "null"
    set page (math $page+1)
    echo "Getting page $page..."
    curl -s $next_link > tmp/places-from-here-maps-$page.json
    set next_link (cat tmp/places-from-here-maps-$page.json | jq -r '.next')
end

echo "Done!"
