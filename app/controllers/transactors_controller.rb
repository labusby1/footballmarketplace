class TransactorsController < ApplicationController
  def new
    @transactor = Transactor.new
  end
  
  def create 
    # @buyer = Buyer.create(portfolio_id: User.find(params[:user_id]).portfolio.id, purchase_price: 1)
    @transactor = Transactor.new(transactor_params)
    # @transactor.moveable = @array_of_ids
    if @transactor.save
      flash[:success] = "Transactor Created!"
      redirect_to user_path(id: params[:user_id])
    else
      render root_path
    end
  end
  private
    def transactor_params
      params.require(:transactor).permit(:buyer_id, :seller_id, :transaction_cost, :moveable)
    end
end