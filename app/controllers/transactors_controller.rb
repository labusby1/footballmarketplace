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
      @onthemarket = Onthemarket.find(@transactor.otm_id)
      
      # Update net_worth for buyer and seller
      Portfolio.find(@transactor.buyer_id).calc_net_worth()
      Portfolio.find(@transactor.seller_id).calc_net_worth()
      
      # If an otm is purchased but the number of stocks is less than ideal. A new otm must be made where the new ideal_numer_sold is the remaining number of stocks
      if @onthemarket.ideal_number_sold > @transactor.moveable
        Onthemarket.update(@onthemarket.id, :ideal_number_sold => @onthemarket.ideal_number_sold - @transactor.moveable, :least_possible => 1, :max_number_sold => @transactor.moveable)
        @onthemarket.save
        
      else
        @onthemarket.delete
        @onthemarket.save
      end
      #Redirect the user to their portfolio
      redirect_to user_path(id: params[:user_id])
    else
      render root_path
    end
  end
  private
    def transactor_params
      #Whitelist parameters of the transactor
      params.require(:transactor).permit(:buyer_id, :seller_id, :transaction_cost, :stocks_to_move, :moveable, :otm_id, :sold_on, :stock_symbol, :price_per)
    end
end