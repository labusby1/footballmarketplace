class Transaction < ActiveRecord::Base
  has_one :buyer
end