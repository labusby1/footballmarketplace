class Onthemarket < ActiveRecord::Base
  has_one :portfolio
  serialize :stocks_on_market, Hash
  serialize :least_possible, Hash
end