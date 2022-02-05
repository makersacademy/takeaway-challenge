require_relative 'takeaway'

class Order
  attr_reader :order_cost
 
  def initialize
    @order_cost = []
  end

  def view_menu(takeaway)
    p takeaway.display_menu
  end

  def add_dish(takeaway, dish, quantity)

  end
end

