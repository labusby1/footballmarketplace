class Stock < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :possession
  belongs_to :transactor, optional: true
end