class PortfoliosController < ApplicationController
  
  #GET request for /users/:user_id/portfolio/new
  def new
    # Render black portfolio form
    @portfolio = Portfolio.new
  end
end