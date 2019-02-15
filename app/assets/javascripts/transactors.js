/* global $ */
//Document ready function to target page.
$(document).on('turbolinks:load', function(){
  
  var theForm = $('#new-transactor-form');
  var submitBtn = $('#form-submit-btn');
  var pricePer = $('#price-per-transactor-form').get(0).dataset.pricePer;

  //Target transaction quantity input box.
  var stockQuantityBox = $('#transaction-quantity');
  stockQuantityBox.change(function(){
    //clear previous calculation from the div insides
    document.getElementById("calculate-transaction").innerHTML = '';
    
    //The quantity * price_per will show the total transaction cost.
    var stockQuantity = $('#transaction-quantity').val();
    var outputted = stockQuantity * pricePer;
    var para = document.createElement("P");                       // Create a <p> element
    var t = document.createTextNode(outputted);  // Create a text node
    para.appendChild(t);                                  // Append the text to <p>
    document.getElementById("calculate-transaction").appendChild(para); 
  });
  
  
  
  //When user clicks submit,
  submitBtn.click(function(event){
    //we prevent deault behaviour, pausing the form.
    event.preventDefault();
    submitBtn.val("Processing").prop('disabled', true);
    
    //Inject the quantity * price_per float value into transaction_cost.
    var stockQuantity = $('#transaction-quantity').val();
    var outputted = stockQuantity * pricePer;
    var costOutputBox = $('#calculate-transaction');
    costOutputBox.append($('<input value="'+outputted+'" type="hidden" name="transactor[transaction_cost]", id="transactor_transaction_cost">'));
    costOutputBox.append($('<input value="'+stockQuantity+'" type="hidden" name="transactor[moveable]", id="transactor_moveable">'));
    //theForm.append($('<input type="hidden" name="transactor[transaction_cost]">').val(outputted) );

    //var array_of_stocks = $('#stocks-to-move-input').val();
    // var numberOutputBox = $('#stocks-to-move-output-box');
    // numberOutputBox.append($('<%= @array_of_ids = Stock.where(symbol: @otmobj.stocks_on_market, portfolio_id: @otmobj.portfolio_id).ids.take()%>'));
    // debugger;
    // numberOutputBox.append('<%= js_obj = @array_of_ids.to_json %>');
    // numberOutputBox.append($('<input value= @array_of_ids.to_json type="hidden" name="transactor[stocks_to_move]", id="transactor_stocks_to_move">'));
    
     //<%= content_tag :div, id: "stocks-to-move-input", data: {js_array_to_manipulate: js_array_of_ids} do %><% end %>
    theForm.eq(0).submit();
  });
  //Submit form to rails app.
  
});
