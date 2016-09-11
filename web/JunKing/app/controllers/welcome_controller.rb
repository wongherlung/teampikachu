class WelcomeController < ApplicationController
  def index
  	@users = User.order('recycled_product DESC').all
  	@latest = User.order("updated_at").last
  end
end
