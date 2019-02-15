class TransactorsController < ApplicationController
  def new
    @transactor = Transactor.new
  end
  
  def create 
    # @buyer = Buyer.create(portfolio_id: User.find(params[:user_id]).portfolio.id, purchase_price: 1)
    @transactor = Transactor.new(transactor_params)
    if @transactor.save
      #After a sucessful save, funds are transfered, stocks are tramsfered and the onthemarket object that the transactor was built from, gets deleted
      flash[:success] = "Transactor Created!"
      @transactor.transfer_funds()
      @transactor.transfer_stocks()
      Onthemarket.find(@transactor.otm_id).delete
      #Redirect the user to their portfolio
      redirect_to user_path(id: params[:user_id])
    else
      render root_path
    end
  end
  private
    def transactor_params
      #Whitelist parameters of the transactor
      params.require(:transactor).permit(:buyer_id, :seller_id, :transaction_cost, :stocks_to_move, :moveable, :otm_id)
    end
end