   $( "#new_booking" ).change(function() {
      var year_begin = $("#booking_start_date_1i").val()
      var month_begin = $("#booking_start_date_2i").val()
      var day_begin = $("#booking_start_date_3i").val()

      var year_end = $("#booking_end_date_1i").val()
      var month_end = $("#booking_end_date_2i").val()
      var day_end = $("#booking_end_date_3i").val()

      var begin = new Date(year_begin, month_begin - 1, day_begin)
      var end = new Date(year_end, month_end - 1, day_end)
      var number = Math.round(((end - begin) * 1.15741e-8) / 30)

      document.getElementById('days').innerHTML = number
      document.getElementById('price').innerHTML = number * Number(document.getElementById('horse_price').innerHTML)
    });

