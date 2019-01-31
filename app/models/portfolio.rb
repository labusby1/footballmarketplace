class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :stocks
  belongs_to :buyer, optional: true
  belongs_to :seller, optional: true
  #A Portfolio can have many onthemarket objects acive at one time, 
  has_many :onthemarkets
end