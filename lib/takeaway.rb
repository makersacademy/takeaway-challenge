require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :order_history

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_history = []
    @order_class = order_class
  end

  def print_menu
    menu.print_menu
  end

  def order_item(item,quantity)
    fail 'Sorry, we do not sell this dish' unless menu.item_available?(item)
    current_order.add_items(item, quantity, cost = menu.items[item])
  end

  def verify_order(user_total)
    fail "Total does not match current order, order not processed" unless user_total == @current_order.total
    "Total verified - order processed"
  end

  private

  def current_order
    @current_order ||= @order_class.new
  end

end
