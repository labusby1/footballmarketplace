class Transactor < ActiveRecord::Base
  has_one :buyer
  has_one :seller
  has_many :stocks
  serialize :moveable, Array
end
