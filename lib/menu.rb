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
