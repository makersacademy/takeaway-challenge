class Order 

	 attr_reader :dishes

	 def initialize(menu)
 		 @dishes = {}
 		 @menu = menu
 	end

	 def add(dish, quantity)
 		 fail NoItemError, "We're out of #{dish.capitalize}" unless menu.dish?(dish)

 		 dishes[dish] = quantity
 	end

	 def total
 		 items_totals.inject(:+)
 	end

	# private

	
	 def items_totals
 		 dishes.map do |dish, quantity|
  		  menu.price(dish) * quantity
  		end
 	end
	
	 attr_reader :menu
end

class NoItemError < StandardError; end
