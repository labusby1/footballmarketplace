class TransactorsController < ApplicationController
  def new
    @transactor = Transactor.new
  end
  
  def create 
    # @buyer = Buyer.create(portfolio_id: User.find(params[:user_id]).portfolio.id, purchase_price: 1)
    @transactor = Transactor.new(transactor_params)
    if @transactor.save
      flash[:success] = "Transactor Created!"
      @transactor.transfer_funds()
      @transactor.transfer_stocks()
      redirect_to user_path(id: params[:user_id])
    else
      render root_path
    end
  end
  private
    def transactor_params
      params.require(:transactor).permit(:buyer_id, :seller_id, :transaction_cost, :stocks_to_move)
    end
end