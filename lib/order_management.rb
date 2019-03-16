require_relative 'food_menu.rb'

class OrderManagement

  attr_reader :food_menu, :selected_dishes

  def initialize(food_menu)
    @selected_dishes = {}
    @food_menu = food_menu
  end


  def add_to_order(dish, number)
    raise "We don't serve this dish! Sorry :(" if food_menu.we_serve?(dish) == false
    selected_dishes[dish] = number
  end

end