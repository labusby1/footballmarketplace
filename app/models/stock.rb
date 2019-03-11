class Stock < ActiveRecord::Base
  belongs_to :portfolio
  belongs_to :possession
  has_and_belongs_to_many :transactors
  
   
  
end