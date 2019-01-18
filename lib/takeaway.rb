require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu, order = Order)
    @menu = menu.new
    @order = order.new
  end

  def print_menu
    @menu.print_menu
  end

  def add_to_order(dish_number, quantity)
    quantity.times { @order.add(menu_item(dish_number)) }
  end

  def current_total
    @order.current_total
  end

  def order_content
    @order.contents
  end

  def place_order(menu_number, quantity, price)
    raise("Total given is not correct")
  end

  private

  def menu_item(dish_number)
    @menu.list[dish_number]
  end


end
