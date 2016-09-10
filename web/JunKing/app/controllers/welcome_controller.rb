class WelcomeController < ApplicationController
  def index
  	@users = User.order('recycled_product DESC').all
  end
end
