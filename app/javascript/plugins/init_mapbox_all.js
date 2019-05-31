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
  map.fitBounds(bounds, { padding: 70, maxZoom: 15 });
};

const initMapboxAll = () => {
  const mapElement = document.getElementById('all-map');
  if (mapElement != null) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    if (mapElement) {
      const markers = JSON.parse(mapElement.dataset.markers);
      const map = new mapboxgl.Map({
        container: 'all-map',
        style: 'mapbox://styles/mapbox/streets-v10'
      });

      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    }
  }
};

export { initMapboxAll };
