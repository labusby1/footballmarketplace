class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :stocks
  #Optional transactor attributes
  belongs_to :buyer, optional: true
  belongs_to :seller, optional: true
  #A Portfolio can have many onthemarket objects acive at one time, 
  has_many :onthemarkets
  
  def calc_net_worth()
    bal = self.balance
    val = 0.0
    array_of_stocks = Stock.where(portfolio_id: 1).select(:symbol).pluck(:symbol)
    array_of_stocks_u = array_of_stocks.uniq
    for i in 0..array_of_stocks_u.length - 1
      # Make sure that a transactor has been created in the past with the stock selected by enumerator. If not, skip and move
      # to next array_of_stocks_u value.
      @latest_transactor = Transactor.where(stock_symbol: array_of_stocks_u[i]).order("sold_on").last
      if (@latest_transactor && @latest_transactor.price_per)
        # Make sure that the transactor was passed through with a price_per value. If not, make price multiple 0. 
        # if @latest_transactor.price_per?
        @latest_price = @latest_transactor.price_per
      else
        @latest_price = 0.0
      end
      val += array_of_stocks.count(array_of_stocks_u[i]) * @latest_price
    end
    self.update(net_worth: bal + val)
  end
  
end