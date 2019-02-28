/* global $ Morris */
$(document).on('turbolinks:load', function(){
  
  if ($('meta[name=psj]').attr('controller') == 'users' && $('meta[name=psj]').attr('action') == 'show'){
    new Morris.Line({
      // ID of the element in which to draw the chart.
      element: 'transactor_chart',
      // Chart data records -- each entry in this array corresponds to a point on
      // the chart.
      data: $('#transactor_chart').data('transactors'),
      // The name of the data record attribute that contains x-values.
      xkey: 'sold_on',
      // A list of names of data record attributes that contain y-values.
      ykeys: ['transaction_cost'],
      // Labels for the ykeys -- will be displayed when you hover over the
      // chart.
      labels: ['Transaction_Cost']
    });
  }
  
  else {
    return
  }
});