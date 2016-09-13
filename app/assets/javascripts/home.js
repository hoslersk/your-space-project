$( document ).ready(function() {

  $( function() {
      $( "#price-range" ).slider({
        range: true,
        min: 0,
        max: 1000,
        values: [ 400, 600 ],
        slide: function( event, ui ) {
          $( "#price-range-text" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
          $( "#price_min_input").val(ui.values[ 0 ])
          $( "#price_max_input").val(ui.values[ 1 ])
        }
      });
      $( "#price-range-text" ).val( "$" + $( "#price-range" ).slider( "values", 0 ) +
        " - $" + $( "#price-range" ).slider( "values", 1 ) );
    } );

});
