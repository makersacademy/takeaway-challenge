class Order
  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

	 def add(dish, quantity)
<<<<<<< HEAD
    fail  NoItemError, "#{dish.capitalize} is not on the menu!" unless @menu.has_dish?(dish)
=======
    fail  NoItemError, "#{dish.capitalize} is not on the menu!" unless @menu.include?(dish)
>>>>>>> b42d3203840c9168d5fd86b88d6f6ebb5d0ef927
    dishes[dish] = quantity
 	 end

   private

   
end

class NoItemError < StandardError; end