class OnthemarketsController < ApplicationController
  #GET request to /portfolios/:portfolio_id/onthemarkets/new
  def new
    #Render a blank Onthemarket details form
    @onthemarket = Onthemarket.new
  end
  
  #POST request to /users/:user_id/portfolio/onthemarkets
  def create
    # Ensure that we have the user that fills out form
    @user = User.find(params[:user_id])
    # Create onthemarket linked to specific user
    @onthemarket = @user.portfolio.onthemarkets.new(onthemarket_params)
    #Form inputs for stocks_on_market and least_possible need to be converted from string to hash
    #@onthemarket.stocks_on_market = #JSON.parse params[:onthemarket][:stocks_on_market].gsub('=>', ':')
    #@onthemarket.least_possible = #JSON.parse params[:onthemarket][:least_possible].gsub('=>', ':')
    if @onthemarket.save
      flash[:success] = "Onthemarket Created!"
      redirect_to root_path
    else 
      render action: :new
    end
  end
  
  def index
    @onthemarkets = Onthemarket.all
    @user = User.find(params[:user_id])
  end
  
  private
  #white list the onthemarket parameters
    def onthemarket_params
      params.require(:onthemarket).permit(:buying, :portfolio_id, :stocks_on_market, :least_possible, :ideal_number_sold, :price_per)
    end
end