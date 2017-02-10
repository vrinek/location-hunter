source config.fish
source secrets.fish

set auth_url "https://api.yelp.com/oauth2/token\
?grant_type=client_credentials\
&client_id=$YELP_APP_ID&client_secret=$YELP_APP_SECRET"

echo "Authenticating..."
set access_token (
    curl -X POST -s $auth_url | jq -r '.access_token'
)

set header "Authorization: Bearer $access_token"

set limit 50
set page 1
set next_offset (math "$page * $limit")

set search_url "https://api.yelp.com/v3/businesses/search\
?latitude=$LATITUDE&longitude=$LONGITUDE\
&categories=$YELP_CATEGORY\
&limit=$limit"

echo "Getting page $page..."
curl -s -H $header "$search_url" > tmp/places-from-yelp-$page.json

set total (cat tmp/places-from-yelp-$page.json | jq -r '.total')

while test $next_offset -lt $total
    set page (math "$page + 1")
    set offset $next_offset

    echo "Getting page $page..."
    curl -s -H $header "$search_url&offset=$offset" > tmp/places-from-yelp-$page.json

    set next_offset (math "$page * $limit")
end

echo "Done!"
