require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new(self))
    @menu = menu
    @order = order
  end

  def add(dish, quantity = 1)
    fail "Sorry, we don't have #{dish} in our menu." unless @menu.dishes.has_key?(dish)
    @order.add_item(dish, quantity)
    "You added #{quantity} #{dish}(s) to your order."
  end

  def order_summary
    fail "Sorry, but you have no items in your order to summarise" if @order.items.empty?
    @order.summarise
  end

  def total
    '£' + @order.calc_total.to_s
  end

end
