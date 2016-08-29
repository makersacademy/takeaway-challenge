require 'menu'
require 'order'
#sends completed orders to the customer
class Takeaway

  def initialize(menu: Menu.new, order: Order.new)
    @menu = menu
    @order = order
  end

  def display_menu
    menu.print_menu
  end

  def place_order(items)
    items.each {|item, quantity| order.add_item(item, quantity)}
  end

  private

  attr_reader :menu, :order

end
