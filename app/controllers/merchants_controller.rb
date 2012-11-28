class MerchantsController < ApplicationController
  before_filter :authenticate_user!

end
