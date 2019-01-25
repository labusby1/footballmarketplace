class Possession < ActiveRecord::Base
  belongs_to :being
  has_many :clubs
  has_many :players
  has_many :managers
end