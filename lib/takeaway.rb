require_relative "menu"
require_relative "order"

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    print @menu.list
  end

  def add_to_order(dish)
    (@order = Order.new) unless @order
    @order.add(dish)
  end
end
