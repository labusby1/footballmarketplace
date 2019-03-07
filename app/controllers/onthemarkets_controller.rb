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
      
      #Must switch the stocks active trait that make up the onthemarket object to false
      stk_arr = Stock.where(portfolio_id: current_user.portfolio.id, active: true, symbol: @onthemarket.stocks_on_market).take(@onthemarket.ideal_number_sold)
      for i in 0..stk_arr.length-1 do
        stk_arr[i].active = false
        stk_arr[i].save
      end
      
      flash[:success] = "Onthemarket Created!"
      redirect_to user_portfolio_onthemarkets_path
    else 
      render action: :new
    end
  end
  
  def destroy
    @user = User.find(current_user.id)
    @onthemarket = Onthemarket.find(params[:id]) # params[:id] is the is of the onthemarket object!
    stock_activate = Stock.where(portfolio_id: @user.id, active: false,
      symbol: @onthemarket.stocks_on_market).take(@onthemarket.ideal_number_sold)
    stock_activate.each do |sa|
      sa.active = true
      sa.save
    end
    @onthemarket.destroy
    redirect_to user_path(user_id: @user.id)
  end
  
  def index
    @onthemarkets = Onthemarket.all
    @user = User.find(params[:user_id])
  end
  
  private
  #white list the onthemarket parameters
    def onthemarket_params
      params.require(:onthemarket).permit(:buying, :portfolio_id, :stocks_on_market, :least_possible, :ideal_number_sold, :price_per, :max_number_sold)
    end
end