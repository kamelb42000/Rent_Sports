import { Controller } from "@hotwired/stimulus"
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"


export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array

  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue


    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      zoom: 1.5,

    })

    this.map.dragRotate.disable();
    this.map.touchZoomRotate.disableRotation();
    this.map.scrollZoom.disable();
    this.map.addControl(
      new mapboxgl.NavigationControl());
      new mapboxgl.GeolocateControl({
      positionOptions: {
      enableHighAccuracy: true
      },
      // When active the map will receive updates to the device's location as it changes.
      trackUserLocation: true,
      // Draw an arrow next to the location dot to indicate which direction the device is heading.
      showUserHeading: true
      })
      
    this.map.on('load', async () => {

      const geojson = await getLocation();

      this.map.addSource('iss', {
      type: 'geojson',
      data: geojson
      });
      const updateSource = setInterval(async () => {
        const geojson = await getLocation(updateSource);
        map.getSource('iss').setData(geojson);
        }, 2000);

        async function getLocation(updateSource) {
        // Make a GET request to the API and return the location of the ISS.
        try {
        const response = await fetch(
        'https://api.wheretheiss.at/v1/satellites/25544',
        { method: 'GET' }
        );
        const { latitude, longitude } = await response.json();
        // Fly the map to the location.
        map.flyTo({
        center: [longitude, latitude],
        speed: 0.5
        });
        // Return the location of the ISS as GeoJSON.
        return {
        'type': 'FeatureCollection',
        'features': [
        {
        'type': 'Feature',
        'geometry': {
        'type': 'Point',
        'coordinates': [longitude, latitude]
        }
        }
        ]
        };
        } catch (err) {
        // If the updateSource interval is defined, clear the interval to stop updating the source.
        if (updateSource) clearInterval(updateSource);
        throw new Error(err);
        }
        }
        });


    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup({ offset: 25 }).setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(this.map)
    })
  };

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  };
}
