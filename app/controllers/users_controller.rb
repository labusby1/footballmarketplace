class UsersController < ApplicationController
  
  #GET request for /users/:id
  def show
    @user = User.find(params[:id])
    @otm_objs = Onthemarket.where(portfolio_id: params[:id])
  end
  
end