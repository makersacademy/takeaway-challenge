require_relative 'menu'

class Order

  attr_reader :final_order

  def initialize(menu)
    @menu = menu
    @final_order = []
  end

  def add_order(dish_name, quantity)
    fail 'Sorry, #{dish} is not availble' unless @menu.has_dish?(dish_name) 
    if @menu.has_dish?(dish_name)
      dish = @menu.get_dish_obj(dish_name)
      @final_order.push({Ordered_dish: dish, Quantity: quantity})
    end
  end

end