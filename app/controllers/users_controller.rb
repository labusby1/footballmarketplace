class UsersController < ApplicationController
  
  #GET request for /users/:id
  def show
    @user = User.find(current_user.id)
    @otm_objs = Onthemarket.where(portfolio_id: @user.id)
  end
  
end