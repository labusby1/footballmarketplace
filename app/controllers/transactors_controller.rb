class TransactorsController < ApplicationController
  def new
    @transactor = Transactor.new
  end
end