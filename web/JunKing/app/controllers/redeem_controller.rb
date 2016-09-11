class RedeemController < ApplicationController
  def index
  	@name = params['name']
  	@recycled_product = params['recycled_product']
  	@voucher = (@recycled_product.to_d.round(2, :truncate)*0.5).to_f
  end
end
