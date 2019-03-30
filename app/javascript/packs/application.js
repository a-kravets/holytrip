import "bootstrap";
import "../plugins/flatpickr";
import 'mapbox-gl/dist/mapbox-gl.css'; // <-- you need to uncomment the stylesheet_pack_tag in the layout!
import "../plugins/sortable.js";
import { initMapbox } from '../plugins/init_mapbox';
import { searchAlgoliaPlaces } from '../plugins/init_places';

initMapbox();
// searchAlgoliaPlaces();



