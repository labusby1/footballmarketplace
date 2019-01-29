class Buyer < ActiveRecord::Base
  belongs_to :transaction
  has_one :portfolio
end