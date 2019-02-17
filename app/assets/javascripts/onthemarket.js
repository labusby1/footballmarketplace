/* global $ */
//Document ready function to target page.
$(document).on('turbolinks:load', function(){

  // Page specific javascript if statement.
  // The function checks that the page has a meta tag with values of controller and action agreeable to onthemarkets#new. If not ignore below and return.
  if ($('meta[name=psj]').attr('controller') == 'onthemarkets' && $('meta[name=psj]').attr('action') == 'new'){
    var theForm = $('#new-onthemarket-form');
    var submitBtn = $('#form-submit-btn');
    
    
    // Here we listen for a change in the dropdown menu for stocks_on_market
    $(document).on('change','#onthemarket_stocks_on_market', function(){
      
      // create an area for input to be inserted and clear it
      var outputBox = $('#ideal-number-box');
      outputBox.innerHTML = '';
      // We take the value of the dropdown menu item selected which will be used below to search for a div tag in formForSelling partial to use the data value of how many
      //stocks are available to sell.
      var stockSymbolValue = $(this).val();
      
      //Now i want to find the html div tag whos name is 'stock-info-<%= stk %>' (divTagString) and take the data value of
      //data-stockNumber (divTagValue) and plug it into the output box 'input' tag I have below.
      var divTagString = '#stock-info-'+stockSymbolValue
      var divTagValue = $(divTagString).get(0).dataset.stockInfoCount;
      outputBox.append('<h4>Select an indeal number of stocks to sell</h4>');
      
      // divTagVaklue is now the maximum stocks availble to the user to sell. So that value is inserted into the input tag as the max paramter.
      outputBox.append('<input type="number" name="onthemarket[ideal_number_sold]" id="ideal-tag-value" min="1" max='+divTagValue+'>');
    });
    
    submitBtn.click(function(event){
      //We prevent deault behaviour, pausing the form.
      event.preventDefault();
      submitBtn.val("Processing").prop('disabled', true);
      
      // Create a hidden onthemarket tag for the max_number_sold attribute whose value is divTagValue. This value is the maximum number of particular stocks 
      //that the user can choose to sell.
      //This will become part of the client side validations and if the user input (ideal_number_sold) does not agree, the otmarket object is not created
      //(ie. form submition fails).
      var maxQuantityString = $('#onthemarket_stocks_on_market').val(); //Give me MANU
      var divTagString = '#stock-info-'+maxQuantityString;
      var maxTagValue = $(divTagString).get(0).dataset.stockInfoCount;
      
      // Client side validation if statement
      var idealTagValue = $('#ideal-tag-value').val();
      if (idealTagValue <= maxTagValue){
        
        //Output box to append the input value to.
        var maxOutputBox = $('#max-number-sold-output');
        maxOutputBox.append("<h1>Success!<h1>");
        maxOutputBox.append($('<input value='+maxTagValue+' type="hidden" name="onthemarket[max_number_sold]", id="onthemarket_max_number_sold">'));
        theForm.eq(0).submit();
      } else{
        var maxOutputBox = $('#max-number-sold-output');
        maxOutputBox.append("<h4 class = 'text-center'>Your portfolio has only "+maxTagValue+" stocks of this kind available to sell!<h4>");
        
      }
      
      
      //Output box to append the input value to.
      
    });
  }
  else {
    return
  }
});
