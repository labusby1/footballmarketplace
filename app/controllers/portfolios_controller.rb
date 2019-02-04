class PortfoliosController < ApplicationController
  
  #GET request for /users/:user_id/portfolio/new
  def new
    # Render blank portfolio form
    @portfolio = Portfolio.new
  end
  
  #POST request for /users/:user_id/portfolio(.:format)	
  def create
    # Make sure user filling out form is known
    @user = User.find( params[:user_id])
    # Creating a portfolio object for specific user
    @portfolio = @user.build_portfolio(portfolio_params)
    @portfolio.balance = 1000
    @portfolio.net_worth = 1000
    if @portfolio.save
      flash[:success] = "Portfolio Information Updated!"
      redirect_to user_path(id: params[:user_id])
    else
      render action: :new
    end
  end
  
  # GET request to /users/:user_id/portfolio/edit
  def edit
    @user = User.find(params[:user_id])
    @portfolio = @user.portfolio
  end
  
  private
    def portfolio_params
      params.require(:portfolio).permit(:first_name, :last_name)
    end
end