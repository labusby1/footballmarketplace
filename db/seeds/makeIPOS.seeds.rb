
puts 'Making ipos for Premier League clubs...'

admin = User.find_by(admin: true)
clubs = []
clubs << Club.find_by(location: "Munich")


@stocksQuantity = 3
@initialPrice = 1.00

clubs.each do |clb|
  puts 'Adding ' + @stocksQuantity.to_s + ' stocks for ' + clb.name + '...'
  i = 0
  @sellThese = []
  symbolMade = clb.makeSymbol
  while i < @stocksQuantity do
    puts '...'
    #set active to false because they are imediately sold as part of onthemarket object
    stk = Stock.create(stock_name: clb.name, symbol: symbolMade, active: false, created_at: Date.today, updated_at: Date.today,
      portfolio_id: admin.portfolio.id, possession_id: 1, being_id: 2, ipo: true)
    stk.save!
    i += 1
  end
  
  puts 'Adding Onthemarket objects for ' + clb.name
  Onthemarket.create(buying: false, portfolio_id: admin.portfolio.id, stocks_on_market: symbolMade, 
    ideal_number_sold: @stocksQuantity, least_possible: 1, price_per: @initialPrice, max_number_sold: @stocksQuantity)
end

