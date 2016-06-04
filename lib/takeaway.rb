require_relative "menu"

class TakeAway

attr_reader :menu

def initialize(menu = Menu.new)
	@menu = menu
end

def read_menu
	menu.show
end


# def order(product, quantity = 1)
# 	returns a list of dishes with quantities and prices
# 	if the sum is not correct, it should raise an error, otherwise
# 		the customer receives a message saying that the order was
# 		successfully placed and and will be delivered 1 hour from now
# end
#
# def add (product, quantity = 1) # => quantity = 1 by default
#
# end
#
# def basket_summary
# 	returns  list of ordered dishes
# end
#
# def total
# 	returns total price of ordered dishes
# end
#
# def check
# 	checks sum of ordered dishes
# end
#
# def sends_message
# 	sends confirmation message through twilio api
# 	(will be delivered 1 hour from now)
# end
#
#
# def checkout
# 	deducts money from wallet?
# end



end
