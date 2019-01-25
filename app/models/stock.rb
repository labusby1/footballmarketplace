class Stock < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :possession
end