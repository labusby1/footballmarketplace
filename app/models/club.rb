class Club < ActiveRecord::Base
  has_and_belongs_to_many :leagues
  belongs_to :possession
  has_many :players
  has_one :manager
end