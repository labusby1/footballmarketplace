class Being < ActiveRecord::Base
  has_many :leagues
  has_many :possessions
end