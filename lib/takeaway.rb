require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :order 

  def initialize(menu = Menu.new, order = Order)
    @menu = menu
    @order = order.new
  end

  def view_menu
    @menu.print_menu
  end

  def add_to_order(item, quantity = 1)
    @menu.item_available?(item) ? @order.add_item(item, quantity) : not_available
  end

  private 

  def not_available
    raise "Please select items from the menu."
  end

end
