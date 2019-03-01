/* global $ Morris */
$(document).on('turbolinks:load', function(){
  
  if ($('meta[name=psj]').attr('controller') == 'users' && $('meta[name=psj]').attr('action') == 'show'){
    
    var outputBox = $('#chart-output');
    var stringStockDefault = '#transactor_chart_'+ $('#mvs-string-tag').data('transactors');
    
    //Default chart to create is the most valuable which was determined in the show file.
    new Morris.Line({
      // ID of the element in which to draw the chart.
      element: 'chart-output',
      // Chart data records -- each entry in this array corresponds to a point on
      // the chart.
      data: $(stringStockDefault).data('transactors'),
      // The name of the data record attribute that contains x-values.
      xkey: 'sold_on',
      // A list of names of data record attributes that contain y-values.
      ykeys: ['price_per'],
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      labels: ['Price per stock']
    });
    
    
    
    
    //Need to listen for a user to select a stock they wish to be charted 
    $('#select-a-stock').change(function(){
      var stockSelected = $(this).val();
      var stringStockSelected = '#transactor_chart_'+stockSelected;
      // var parentEl = outputBox;
      
      // Clear all children html nodes for the transactor_chart element where. This clears the previous 
      //selected chart.
      while (outputBox[0].firstChild) {
        outputBox[0].firstChild.remove();
      }
      new Morris.Line({
        // ID of the element in which to draw the chart.
        element: 'chart-output',
        // Chart data records -- each entry in this array corresponds to a point on
        // the chart.
        data: $(stringStockSelected).data('transactors'),
        // The name of the data record attribute that contains x-values.
        xkey: 'sold_on',
        // A list of names of data record attributes that contain y-values.
        ykeys: ['price_per'],
        // Labels for the ykeys -- will be displayed when you hover over the
        // chart.
        labels: ['Price per stock']
      });
    });
  }
  
  else {
    return
  }
});