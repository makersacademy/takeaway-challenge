# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered


class Menu
	attr_reader :dish_list
	
	def initialize 
		@dish_list = [
			{name: "Miso", price: 2},
			{name: "Sushi combo A", price: 8},
			{name: "Sushi combo B", price: 11},
			{name: "Chirashi", price: 9},
			{name: "Green tea ice cream", price: 3}
		]
	end
	
	def view
		@dish_list.each.with_index do |dish, index|
			puts "#{index + 1}. #{dish[:name]} (#{dish[:price]})" 		
		end
	end
end

menu = Menu.new
menu.view
