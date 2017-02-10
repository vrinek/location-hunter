{
    type: "FeatureCollection",
    features: [
        .businesses[] | {
            type: "Feature",
            geometry: {
                type: "Point",
                coordinates: [
                    .coordinates.longitude,
                    .coordinates.latitude
                ]
            },
            properties: {
                title: .name,
                "marker-symbol": "y",
                "marker-color": "#bf2519"
            }
        }
    ]
}
