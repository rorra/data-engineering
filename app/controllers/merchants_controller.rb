class MerchantsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @merchants = Merchant.all
  end

end
