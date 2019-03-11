
puts 'Making ipos for Premier League clubs...'

admin = User.find_by(admin: true)
clubs = Club.all

clubs.each do |clb|
  puts 'Adding 10 stocks for ' + clb.name
  i = 0
  while i < 10 do
    puts '...'
    stk = Stock.create(stock_name: clb.name, symbol: clb.makeSymbol, active: true, created_at: Date.today, updated_at: Date.today,
      portfolio_id: admin.portfolio.id, possession_id: 1, being_id: 2, ipo: true)
    stk.save!
    i += 1
  end
end

