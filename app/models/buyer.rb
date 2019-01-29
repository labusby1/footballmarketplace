class Buyer < ActiveRecord::Base
  belongs_to :transaction
end