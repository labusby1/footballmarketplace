class Seller < ActiveRecord::Base
  belongs_to :transactor
  has_one :portfolio
end