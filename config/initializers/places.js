var places = require('places.js');
var placesAutocomplete = places({
  appId: ENV["ALGOLIA_SEARCH_APP_ID"],
  apiKey: <ENV["ALGOLIA_SEARCH_API_KEY"],
  container: document.querySelector('#address-input')
});
