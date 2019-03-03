puts 'Adding Transactors:'


@i = 0
@stop = 10
@portfolio = 0
@portfolioBuyer = 0


@portfolios = {buyer: Portfolio.find(1), seller: Portfolio.find(2)} #first conditional


while @i < @stop do
  
  price = rand(0.01...9.99)
  
  Onthemarket.create(buying: false, portfolio_id: @portfolios[:seller].id, stocks_on_market: "MUN", ideal_number_sold: 1, least_possible: 1,
    max_number_sold: 1, price_per: price)
    
  Transactor.create(buyer_id: @portfolios[:buyer].id, seller_id: @portfolios[:seller].id, price_per: price, transaction_cost: price,
    moveable: 1, stocks_to_move: "[9]", otm_id: 2, stock_symbol: "MUN", sold_on: Time.now)
    
  Onthemarket.find(2).delete
  placeholder = @portfolios[:buyer]
  @portfolios[:buyer] = @portfolios[:seller]
  @portfolios[:seller] = placeholder
  
  @i += 1
  sleep 60
end
