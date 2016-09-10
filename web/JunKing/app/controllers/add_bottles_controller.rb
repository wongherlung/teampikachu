class AddBottlesController < ApplicationController
  def new
	puts 'hello'
	@user = User.new(params.require(:user).permit(:name, :recycled_product))
	@user.save!

	# @new_user = User.find_by_name(params[:name])
	# render json: @new_user
  end

  def create
  end
end
