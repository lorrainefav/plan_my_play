// app/javascript/packs/map.js
import 'mapbox-gl/dist/mapbox-gl.css'
// ADD THIS LINE 👇 (styling)
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
// ADD THIS LINE 👇 (js)
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';
// [ ... ]
if (mapElement) {
  // [ ... ]
  map.addControl(new MapboxGeocoder({
    accessToken: mapboxgl.accessToken
  }));
}

const addressInput = document.getElementById('flat_address');

if (addressInput) {
  const places = require('places.js');
  const placesAutocomplete = places({
    container: addressInput
  });
}
