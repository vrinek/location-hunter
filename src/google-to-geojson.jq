{
    type: "FeatureCollection",
    features: [
        .results[] | {
            type: "Feature",
            geometry: {
                type: "Point",
                coordinates: [
                    .geometry.location.lng,
                    .geometry.location.lat
                ]
            },
            properties: {
                title: .name,
                "marker-symbol": "g",
                "marker-color": "#da4941"
            }
        }
    ]
}
