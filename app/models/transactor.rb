class Transactor < ActiveRecord::Base
  has_one :buyer
  has_one :seller
  has_many :stocks
  serialize :moveable, Array
  
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
  
  def transfer_stocks()
    vendor = Portfolio.find(self.seller_id)
    customer = Portfolio.find(self.buyer_id)
    stocks_array = self.moveable
    stocks_array.each do |s|
      stock = Stock.find(s)
      stock.portfolio_id = customer.id
    end
    
    Transactor.transaction do 
      stocks_array.each do |s|
        stock = Stock.find(s)
        raise "Transaction of stocks failed!" unless stock.save 
      end
    end
  end
  
  private
    def transaction_success
      Logger.info "Transfer succeed for Account #{self.to_param}"
    end
    def transaction_failed
      Logger.warn "Transfer failed for Account #{self.to_param}"
    end
end
