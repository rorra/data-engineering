class SalesController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:merchant_id]
      @sales = Merchant.find(params[:merchant_id]).sales.all
    elsif params[:product_id]
      @sales = Product.find(params[:product_id]).sales.all
    else
      @sales = Sale.all
    end
  end


end
