# Location Hunter

This is a small project about populating maps with useful data.

In its current state it's good for searching multiple sources for a certain type of "place" and
gathering all results into a [GeoJSON file](http://geojson.org).

## Requirements

* [Fish](https://fishshell.com)
* [jq](https://stedolan.github.io/jq/)
* A bunch of API keys:
    * [Google maps](https://console.developers.google.com/apis/credentials)
    * [Yelp](https://www.yelp.com/developers/v3/manage_app)
    * [Foursquare](https://foursquare.com/developers/apps)
    * [Here maps](https://developer.here.com/projects)

> If you're missing any API key, comment the relevant section of `process.fish` out

## Usage

1. Edit `config.fish`
2. Copy `secrets.fish.template`, edit & rename to `secrets.fish`
3. Run `fish process.fish`
4. Upload resulting `places.geojson` to https://geojson.io/
