jq '{
    type: "FeatureCollection",
    features: [
        .items[] | {
            type: "Feature",
            geometry: {
                type: "Point",
                coordinates: [
                    .position[1],
                    .position[0]
                ]
            },
            properties: {
                title,
                "marker-symbol": "h",
                "marker-color": "#65c1c2"
            }
        }
    ]
}'
