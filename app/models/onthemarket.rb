class Onthemarket < ActiveRecord::Base
  #Onthemarket will store the foreign key, namely a portfolio_id
  belongs_to :portfolio
  #serialize :stocks_on_market, Array
  
  #Validations
  validates :stocks_on_market, :ideal_number_sold, :price_per, :least_possible, presence: true
  validates :ideal_number_sold, :least_possible, :numericality => {greater_than: 0, message: 'Must be positive'}
  validates :ideal_number_sold, :numericality => {less_than_or_equal_to: :max_number_sold}
  validates :price_per, :numericality => {greater_than_or_equal_to: 0.01}
  validates :least_possible, :numericality => {less_than_or_equal_to: :ideal_number_sold, message: 'must be less than or equal to ideal transaction quantity'}


  #sellThese is used to switch all stocks involved in an onthemarket propossal to active: false since the user can only propose to sell
  # an individual stock one at a time
  def sellThese
    stk_arr = Stock.where(portfolio_id: self.portfolio_id, active: true, symbol: self.stocks_on_market).take(self.ideal_number_sold)
    for i in 0..stk_arr.length-1 do
      stk_arr[i].active = false
      stk_arr[i].save
    end
  end
  
  def buyThese
    stock_activate = Stock.where(portfolio_id: self.portfolio_id, active: false,
      symbol: self.stocks_on_market).take(self.ideal_number_sold)
    stock_activate.each do |sa|
      sa.active = true
      sa.save
    end
    
  end
end