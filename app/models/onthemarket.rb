class Onthemarket < ActiveRecord::Base
  belongs_to :portfolio
  serialize :stocks_on_market, Hash
  serialize :least_possible, Hash
end