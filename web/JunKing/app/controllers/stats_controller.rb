class StatsController < ApplicationController
	def index
		@dates = User.pluck(:updated_at).map{ |n| n.to_date.strftime("%d %b %Y") }.uniq
		
		# for each date 
		# 	sum recycled_product in that date 
		product_arr = Array.new 
		for day in @dates
			products = User.where('DATE(updated_at) = ?', day.to_date).pluck(:recycled_product)
			product_arr.push(products.sum) 
		end

		@recycled_products = product_arr

		users_arr = Array.new 
		for day in @dates
			num = User.where('DATE(updated_at) = ?', day.to_date).pluck(:name)
			users_arr.push(num.size) 
		end
		@num_users = users_arr

		puts @dates
		puts @recycled_products
		puts @num_users
	end
end