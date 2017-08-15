$(document).ready(function(){
  $(".target").submit(function(event) {
    event.preventDefault();
    var address = $("#inlineFormInput").val();
    console.log(address);
    $.ajax({
      type: "GET",
      url: "https://maps.googleapis.com/maps/api/geocode/json?address=" + address,
      success: function(data) {
        var latAdress = data["results"][0]["geometry"]["location"]["lat"];
        var lngAdress = data["results"][0]["geometry"]["location"]["lng"];
        buildMap(latAdress, lngAdress);
      },
      error: function(jqXHR) {
        console.error(jqXHR.responseText);
      }
    });
  });

    var buildMap = function(latAdress, lngAdress){
    var map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: latAdress, lng: lngAdress },
      zoom: 14  // Change this value from 0 to 18
    });

    var marker = new google.maps.Marker({
      map: map,
      position: { lat: latAdress, lng: lngAdress }
    });
  }


});
