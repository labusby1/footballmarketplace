class UsersController < ApplicationController
  
  #GET request for /users/:id
  def show
    @user = User.find(params[:id])
  end
  
end