require_relative 'menu'
require_relative 'order'

# Understands managing orders
class Takeaway
  attr_reader :menu

  def initialize(order_class = Order)
    @order_class = order_class
    @menu = Menu.new
    empty_basket
  end

  def empty_basket
    @order = @order_class.new
  end

  def check_basket
    @order.basket
  end

  def add(item, quantity = 1)
    raise suggest_spoiling_stock(item) unless on_menu?(item)
    @order.add_to_basket(item, quantity)
  end

  def view_menu
    @menu.dishes
  end

  def total
    "£#{format('%.2f', 0.00)}"
  end

  private

  def on_menu?(item)
    view_menu.include?(item.downcase.capitalize)
  end

  def suggest_spoiling_stock(item)
    "#{item} is not on the menu. Why not try our delicious Cleanout curry?"
  end
end
