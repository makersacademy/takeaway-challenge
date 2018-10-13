require_relative 'menu'
require_relative 'order'

class Takeaway

  include Menu

  def initialize(new_order = Order.new)
    @new_order = new_order
  end

  def menu
    print format_menu_items
  end

  def show_order_details
    p @new_order.order_items
  end

  def add_to_order(name, quantity = 1)
    @new_order.add_dish(name, quantity)
  end

  # private

  attr_reader :new_order


end
