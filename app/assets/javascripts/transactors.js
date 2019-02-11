/* global $ */
//Document ready function to target page.
$(document).on('turbolinks:load', function(){
  
  var theForm = $('#new-transactor-form');
  var submitBtn = $('#form-submit-btn');
  var pricePer = $('#price-per-transactor-form')
  var priceBtn = $('#calculate-transaction')
  
  //Target transaction quantity input box.
  var stockQuantity = $('#transaction-quantity').val()
  
  //When a user clicks the calculate cost button,
  
  //The quantity * price_per will show the total transaction cost.
  
  //When user clicks submit,
  submitBtn.click(function(event){
     //we prevent deault behaviour, pausing the form.
    event.preventDefault();
    //Inject the quantity * price_per float value into transaction_cost.
    stockQuantity = $('#transaction-quantity').val()
  });
  //Submit form to rails app.
  
});
