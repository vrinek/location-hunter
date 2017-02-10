echo "Here maps:"
fish src/get-places-from-here-maps.fish
for file in (ls tmp/places-from-here-maps-*.json)
    echo $file
    cat $file | jq -f src/here-to-geojson.jq > $file.geojson
end

echo "Google maps:"
fish src/get-places-from-google-maps.fish
for file in (ls tmp/places-from-google-maps-*.json)
    echo $file
    cat $file | jq -f src/google-to-geojson.jq > $file.geojson
end

echo "Yelp:"
fish src/get-places-from-yelp.fish
for file in (ls tmp/places-from-yelp-*.json)
    echo $file
    cat $file | jq -f src/yelp-to-geojson.jq > $file.geojson
end

echo "Foursquare:"
fish src/get-places-from-foursquare.fish
for file in (ls tmp/places-from-foursquare-*.json)
    echo $file
    cat $file | jq -f src/foursquare-to-geojson.jq > $file.geojson
end

cat tmp/*.geojson | jq -s -f src/concatenate-geojson.jq > places.geojson
