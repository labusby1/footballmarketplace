/* global $ */
//Document ready function to target page.
$(document).on('turbolinks:load', function(){
  
  var theForm = $('#new-transactor-form');
  var submitBtn = $('#form-submit-btn');
  var pricePer = $('#price-per-transactor-form').get(0).dataset.pricePer;
  var priceBtn = $('#calculate-transaction');

  //Target transaction quantity input box.
  var stockQuantityBox = $('#transaction-quantity');
  stockQuantityBox.change(function(){
    //The quantity * price_per will show the total transaction cost.
    var stockQuantity = $('#transaction-quantity').val();
    var outputted = stockQuantity * pricePer;
    var para = document.createElement("P");                       // Create a <p> element
    var t = document.createTextNode(outputted);       // Create a text node
    para.appendChild(t);                                  // Append the text to <p>
    document.getElementById("calculate-transaction").appendChild(para); 
  });
  
  
  
  // //When user clicks submit,
  // submitBtn.click(function(event){
  //   //we prevent deault behaviour, pausing the form.
  //   event.preventDefault();
  //   submitBtn.val("Processing").prop('disabled', true);
  //   //Inject the quantity * price_per float value into transaction_cost.
  //   stockQuantity = $('#transaction-quantity').val();
  // });
  // //Submit form to rails app.
  
});
