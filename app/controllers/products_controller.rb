class ProductsController < ApplicationController
  before_filter :authenticate_user!

  def index
    if params[:merchant_id]
      @products = Merchant.find(params[:merchant_id]).products.all
    else
      @products = Product.all
    end
  end

end
