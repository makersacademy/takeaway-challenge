class Order 

	 attr_reader :dishes

	 def initialize(menu)
 		 @dishes = {}
 		 @menu = menu
 	end

	 def add(dish, quantity)
 		 fail NoItemError, "Sorry, we removed #{dish.capitalize} from the menu due to unpopular demand!" unless menu.has_dish?(dish)

 		 dishes[dish] = quantity
 	end

	 def total
 		 items_totals.inject(:+)
 	end

	private

	 def items_totals
 		 dishes.map do |dish, quantity|
  		  menu.price(dish) * quantity
  		end
 	end
	
	

	 attr_reader :menu

end

class NoItemError < StandardError; end
