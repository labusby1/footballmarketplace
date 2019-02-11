class Onthemarket < ActiveRecord::Base
  #Onthemarket will store the foreign key, namely a portfolio_id
  belongs_to :portfolio
  #serialize :stocks_on_market, Array
  
  #Validations
  validates :stocks_on_market, :ideal_number_sold, :price_per, :least_possible, presence: true

end