puts 'Deleting ipos...'
Stock.where(ipo: true).each do |stk|
  stk.delete
end

Onthemarket.where(ipo: true).each do |otm|
  otm.delete
end

puts 'Done!'