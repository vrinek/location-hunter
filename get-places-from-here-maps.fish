source config.fish
source secrets.fish

curl -s "https://places.cit.api.here.com/places/v1/discover/search\
?at=$LATITUDE%2C$LONGITUDE\
&q=$SEARCH_QUERY\
&app_id=$HERE_APP_ID&app_code=$HERE_APP_CODE"
