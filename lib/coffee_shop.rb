require_relative "order"

# Understands how to take orders from the customer
class CoffeeShop
  attr_reader :menu

  def initialize(order = Order.new)
    @order = order
    @menu = @order.menu
  end

  def read_menu
    menu.drinks
  end
end
