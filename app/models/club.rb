class Club < ActiveRecord::Base
  has_and_belongs_to_many :leagues
  has_many :players
end