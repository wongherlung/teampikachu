class StatsController < ApplicationController
	def index
		@dates = User.pluck(:created_at).map{ |n| n.to_date.strftime("%d %b %Y") }.uniq
		
		# for each date 
		# 	sum recycled_product in that date 
		product_arr = Array.new 
		for day in @dates
			products = User.where('DATE(created_at) = ?', day.to_date).pluck(:recycled_product)
			product_arr.push(products.sum) 
		end

		@recycled_products = product_arr
		puts @dates
		puts @recycled_products
	end
end