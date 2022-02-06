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
    quantity.times { @dishes << dish }
    cost = takeaway.menu[dish]
    quantity.times { @order_cost << cost }
  end

  def total
    @order_cost.sum
  end

  def verify_order(takeaway)
    check_arr = []
    @dishes.each { check_arr << takeaway.menu[i] }
    check_arr.sum == total 
  end

  def place_order
    # send @dishes to takeaway 
    @dishes.clear
    @order_cost.clear
  end
end
