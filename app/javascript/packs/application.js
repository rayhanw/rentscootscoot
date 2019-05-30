import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';

import { initMapbox } from '../plugins/init_mapbox';
import { initMapboxAll } from '../plugins/init_mapbox_all';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { booking } from 'components/booking'

initAutocomplete();
initMapbox();
initMapboxAll();
booking();
