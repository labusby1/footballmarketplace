/* global $ unless */
//Document ready function to target page.
$(document).on('turbolinks:load', function(){
  //Checking for page specific javascript
  if ($('meta[name=psj]').attr('controller') == 'transactors' && $('meta[name=psj]').attr('action') == 'new'){
    // Global variable assignement
    var theForm = $('#new-transactor-form');
    var submitBtn = $('#form-submit-btn');
    var pricePer = $('#price-per-transactor-form').get(0).dataset.pricePer;
    var stockQuantityDefault = parseInt($('#price-per-transactor-form').get(0).dataset.idealNumberSold);
    var originalBalance = parseFloat($('#price-per-transactor-form').get(0).dataset.currentBalance);
    var outputtedCost = Math.round(stockQuantityDefault * pricePer*100)/100;
    var outputtedTableBought = $('#stocks-to-be-bought');
    var outputtedTableCost = $('#costbox');
    var outputtedTableCostNeg = $('#costboxNeg');
    var outputtedTableBalance = $('#balanceAfterPurchase');
    var stockQuantityBox = $('#transaction-quantity');
    
    
    // As a default the transaction table will hold stockQuantityDefault number of stocks
    // ouputtedTableBought.append('')
    outputtedTableBought.append(stockQuantityDefault);
    // As a default the transaction table will hold the stockQuantityDeault * pricePer as the trnasaction cost
    outputtedTableCost.append(parseFloat(outputtedCost).toFixed(2));
    outputtedTableCostNeg.append(parseFloat(-outputtedCost).toFixed(2));
    outputtedTableBalance.append((originalBalance - outputtedCost).toFixed(2));
    
    //Quick purchase buttons will change the transaction quantity box which in turns changes the transaction table
    var quickPurchase = $('#quick-purchase-one');
    quickPurchase.click(function(){
      event.preventDefault();
      var quickPurchaseNumber = parseInt(quickPurchase.TextContent);
      $('#transaction-quantity').text(quickPurchaseNumber);
    });
    
    //Target transaction quantity input box.
    stockQuantityBox.change(function(){
      //clear previous calculation from the div insides
      document.getElementById("calculate-transaction").innerHTML = '';
      
      //The quantity * price_per will show the total transaction cost.
      var stockQuantity = $('#transaction-quantity').val();
      var outputted = stockQuantity * pricePer;
      
      //The quantity needs to be updatted in the transaction table
      document.getElementById("stocks-to-be-bought").innerHTML = '';
      outputtedTableBought.append(stockQuantity);
      
      // And the two costs needs to be updatted
      document.getElementById("costbox").innerHTML = '';
      outputtedTableCost.append(parseFloat(outputted).toFixed(2));
      document.getElementById('costboxNeg').innerHTML = '';
      outputtedTableCostNeg.append(parseFloat(-outputted).toFixed(2));
      
      // Final balance needs to be updatted aswell
      document.getElementById("balanceAfterPurchase").innerHTML = '';
      outputtedTableBalance.append((originalBalance - outputted).toFixed(2))
      
      
    });
    
    //When user clicks submit,
    submitBtn.click(function(event){
      //We prevent deault behaviour, pausing the form.
      event.preventDefault();
      submitBtn.val("Processing").prop('disabled', true);
      
      //Inject the quantity * price_per float value into transaction_cost.
      var stockQuantity = $('#transaction-quantity').val();
      var outputted = stockQuantity * pricePer;
      var costOutputBox = $('#calculate-transaction');
      costOutputBox.append($('<input value="'+outputted+'" type="hidden" name="transactor[transaction_cost]", id="transactor_transaction_cost">'));
      // Also injecting the stockQuantity value into the transactor form as moveable
      costOutputBox.append($('<input value="'+stockQuantity+'" type="hidden" name="transactor[moveable]", id="transactor_moveable">'));
      
      //Continues with form submittion
      theForm.eq(0).submit();
    });
    //Submit form to rails app.
  }
  else {
    return
  }
});
