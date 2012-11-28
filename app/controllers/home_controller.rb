class HomeController < ApplicationController
  def index
    if user_signed_in?
      render
    else
      render action: 'index_not_signed_in'
    end
  end
end
