class Onthemarket < ActiveRecord::Base
  #Onthemarket will store the foreign key, namely a portfolio_id
  belongs_to :portfolio
  #serialize :stocks_on_market, Array
  
  #Validations
  validates :stocks_on_market, :ideal_number_sold, :price_per, :least_possible, presence: true
  validates :ideal_number_sold, :least_possible, :numericality => {greater_than: 0, message: 'Must be positive'}
  validates :ideal_number_sold, :numericality => {less_than_or_equal_to: :max_number_sold}
  validates :price_per, :numericality => {greater_than_or_equal_to: 0.01}
  validates :least_possible, :numericality => {less_than_or_equal_to: :ideal_number_sold, message: 'must be less than or equal to ideal transaction quantity'}

end