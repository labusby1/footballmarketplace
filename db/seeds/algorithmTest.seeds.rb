puts 'Changing stocks to false ipos'

def changeToFalse
  for i in 1..10
   st = Stock.find(i)
   st.ipo = false
   st.save
  end
end

changeToFalse
