require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new(self))
    @menu = menu
    @order = order
  end

  def add(dish, quantity = 1)
    add_to_order(dish, quantity)
  end

  private

  def add_to_order(dish, quantity)
    fail "Sorry, we don't have #{dish} in our menu." unless @menu.dishes.has_key?(dish)
    @order.add_item(dish, quantity)
    p "You added #{quantity} #{dish}(s) to your order."
  end

end
