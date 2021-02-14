require_relative 'dish'
require_relative 'order'

class TakeawayApp
		attr_reader :available_dishes, :order

		def initialize(order = Order.new)
				@available_dishes = []
				@order = order
		end

		def check
				@available_dishes.each do |item|
						puts "#{item.name}, £#{item.price}"
				end
		end

		def add_dish(dish)
				@available_dishes << dish
		end

		def select(dish)
				# select will send a dish to Order's cart 
				order.cart << dish 
				order.cart.flatten if dish == Array 
		end

end

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given
# matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as 
# "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
