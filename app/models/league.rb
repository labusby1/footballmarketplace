class League < ActiveRecord::Base
  belongs_to :being
  has_and_belongs_to_many :clubs
end
