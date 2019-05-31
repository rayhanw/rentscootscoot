import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popUp = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popUp)
      .addTo(map);
  });
}

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();

  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
};

const initMapboxAll = () => {
  const mapElement = document.getElementById('all-map');
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

  if (mapElement) {
    const map = new mapboxgl.Map({
      container: 'all-map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(map);
      });

    fitMapToMarkers(map, markers);
    addMarkersToMap(map, markers);
  }
};

export { initMapboxAll };
