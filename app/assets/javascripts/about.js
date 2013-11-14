
var geojson = [
  { "geometry": { "type": "Point", "coordinates": [ -104.99259, 39.73351 ] },
    "properties": { "id": "cover", "zoom": 13 } } },
];

var tiles = mapbox.layer().tilejson({
  tiles: [ "http://a.tiles.mapbox.com/v3/rsoden.map-wjcj2udt/{z}/{x}/{y}.png" ]
});

mapbox.markers.marker_baseurl = 'https://a.tiles.mapbox.com/v3/marker/';
