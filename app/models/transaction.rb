class Transaction < ActiveRecord::Base
  has_one :buyer
  has_one :seller
end