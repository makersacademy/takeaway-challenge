require_relative 'menu'

class Customer

include Menu

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def list_of_dishes
    Menu::MENU
  end

  def add_dish(dish, quantity)
    order.add_dish(dish, quantity)
  end

  def total_correct(total)
    total == order.total
  end

  def ordered_dishes
     order.dishes
  end

  def place_order(list = ordered_dishes, total)
    fail "Order is empty" if list.empty?
    fail "Total is not correct" if !total_correct(total)

  end

end

