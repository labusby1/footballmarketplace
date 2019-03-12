class Transactor < ActiveRecord::Base
  has_one :buyer
  has_one :seller
  has_many :stocks
  has_and_belongs_to_many :stocks
  
  #Method to transfer funds from the buyer portfolio to the seller portfolio
  def transfer_funds()
    vendor = Portfolio.find(self.seller_id)
    customer = Portfolio.find(self.buyer_id)
    amount = self.transaction_cost
    customer.balance -= amount
    vendor.balance += amount
    
    Transactor.transaction do 
      raise "Transaction of funds failed!" unless customer.save && vendor.save
    end
  end
  
  #Method to transfer the stocks form seller to buyer
  #changes the portfolio id on the stocks that are included in transaction
  def transfer_stocks()
    customer = Portfolio.find(self.buyer_id)
    #Here, we take a string from the transactor object and convert it to an array
    stocks_array = self.stocks_to_move.split(',')
    stocks_array = stocks_array.take(self.moveable)
   
    for i in 0..stocks_array.length - 1 do
      stock = Stock.find(stocks_array[i].tr('[]','').to_i)
      #Stock is transfered to new owner
      stock.portfolio_id = customer.id
      stock.active = true
      if stock.ipo?
        stock.ipo = false
      end
      stock.save!
    end
  end
  
  private
    def transaction_success
      Logger.info "Transfer succeeded for Account #{self.to_param}"
    end
    def transaction_failed
      Logger.warn "Transfer failed for Account #{self.to_param}"
    end
end
