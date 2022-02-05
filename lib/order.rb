require_relative 'takeaway'

class Order
  attr_reader :order_cost
  attr_reader :dishes
 
  def initialize
    @order_cost = []
    @dishes = []
  end

  def view_menu(takeaway)
    p takeaway.display_menu
  end

  def add_dish(takeaway, dish, quantity)
    @dishes << dish
    cost = takeaway.menu[dish]
    (@order_cost << cost) * quantity
  end
end

