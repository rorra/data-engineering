class SalesController < ApplicationController
  before_filter :authenticate_user!

end
