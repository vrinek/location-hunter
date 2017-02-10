jq -s '{
    type: "FeatureCollection",
    features: (
        [.[].features] | add
    )
}'
