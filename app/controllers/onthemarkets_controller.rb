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
    @onthemarket = @user.build_onthemarket(onthemarket_params)
    if @onthemarket.save
      flash[:success] = "Onthemarket Created!"
      redirect_to root_path
    else 
      render action: :new
    end
  end
  
  private
  #white list the onthemarket parameters
    def onthemarket_params
      params.require(:onthemarket).permit(:buying, :portfolio_id, :stocks_on_market, :least_possible)
    end
end