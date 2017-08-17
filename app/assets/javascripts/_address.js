$(document).ready(function() {
  var search_address = $('#search_address').get(0);

  if (search_address) {
    var autocomplete = new google.maps.places.Autocomplete(search_address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(search_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  $('#search_address').trigger('blur').val(components);
}


horse_address

$(document).ready(function() {
  var horse_address = $('#horse_address').get(0);

  if (horse_address) {
    var autocomplete = new google.maps.places.Autocomplete(horse_address, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(horse_address, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});

function onPlaceChanged() {
  var place = this.getPlace();
  var components = getAddressComponents(place);

  $('#horse_address').trigger('blur').val(components);
}
