source config.fish
source secrets.fish

echo "Getting page 1..."

set search_url "https://maps.googleapis.com/maps/api/place/nearbysearch/json\
?key=$GOOGLE_MAPS_API_KEY\
&location=$LATITUDE%2C$LONGITUDE&radius=5000\
&type=$GOOGLE_PLACE_TYPE"

curl -s $search_url > tmp/places-from-google-maps-1.json

set page 1

set next_page_token (cat tmp/places-from-google-maps-1.json | jq -r '.next_page_token')

while test $next_page_token != "null"
    set page (math $page+1)
    echo "Getting page $page..."
    sleep 2
    curl -s "$search_url&pagetoken=$next_page_token" > tmp/places-from-google-maps-$page.json
    set next_page_token (cat tmp/places-from-google-maps-$page.json | jq -r '.next_page_token')
end

echo "Done!"
