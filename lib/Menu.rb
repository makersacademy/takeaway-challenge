require_relative 'Menu'

class Menu

	DEFAULT_MENU = { "Margarita" => 6.00, 
	        "Chorizo" => 7.00, 
	        "Napolitana" => 7.00, 
	        "Pepperoni" => 7.00,
	        "Wild Mushroom" => 7.00,
	        "Sausage & Wild Broccolli" => 7.00 }

	def see_menu
		DEFAULT_MENU
	end

	def order(item, amount)
#     loop do
#     	puts "What would you like?"
#     	item = gets.chomp
#     	puts "How many?"
#     	amount = gets.chomp
#     	if item || amount == 'Done'
#     		break
#     	end
#     end
end

# loop do
#   puts "What would you like to order?"
#   item = gets.chomp
#   puts "And how many?"
#   amount = gets.chomp
#     if item == 'Order'
#     break
#   end
# end
	
end
