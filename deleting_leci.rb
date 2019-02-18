Stock.find_by(stock_name: "Leicster City").each do |stk|
  Stock.update(stk.id, stock_name: "Leicester City")
  stk.save!
end