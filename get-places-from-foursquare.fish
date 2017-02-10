source config.fish
source secrets.fish

echo "Getting page 1..."

curl -s "https://api.foursquare.com/v2/venues/search?\
ll=$LATITUDE%2C$LONGITUDE\
&categoryId=$FOURSQUARE_CATEGORY_ID\
&limit=50\
&client_id=$FOURSQUARE_CLIENT_ID&client_secret=$FOURSQUARE_CLIENT_SECRET\
&v=20170210" > tmp/places-from-foursquare-1.json

echo "Done!"
