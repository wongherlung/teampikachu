class AddBottlesController < ApplicationController
  def increment
	puts 'increment'
	@new_user = User.order("updated_at").last
	@new_user.recycled_product = @new_user.recycled_product + 1
	@new_user.save!

	render json: @new_user
  end

  def new
  	puts 'new user'
	@user = User.new(params.permit(:name))
	@user.recycled_product = 0
	@user.save!

	render json: @user
  end
end
