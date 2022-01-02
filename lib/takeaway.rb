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
    fail "Sorry, this dish is not available" unless dish_exists?(dish)
    @order.add(dish)
  end

  def dish_exists?(dish)
    @menu.dishes.has_key?(dish.capitalize)
  end
end
