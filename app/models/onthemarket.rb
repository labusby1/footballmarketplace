class Onthemarket < ActiveRecord::Base
  #Onthemarket will store the foreign key, namely a portfolio_id
  belongs_to :portfolio
  serialize :stocks_on_market, Hash
  serialize :least_possible, Hash
end