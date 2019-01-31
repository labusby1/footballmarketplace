class Portfolio < ActiveRecord::Base
  belongs_to :user
  has_many :stocks
  belongs_to :buyer, optional: true
  belongs_to :seller, optional: true
  belongs_to :onthemarket, optional: true
end