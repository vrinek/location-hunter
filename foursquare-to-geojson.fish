jq '{
    type: "FeatureCollection",
    features: [
        .response.venues[] | {
            type: "Feature",
            geometry: {
                type: "Point",
                coordinates: [
                    .location.lng,
                    .location.lat
                ]
            },
            properties: {
                title: .name,
                "marker-symbol": "f",
                "marker-color": "#fa4778"
            }
        }
    ]
}'
