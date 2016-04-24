require_relative 'menu'
require_relative 'order'

class TakeAway
  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new(menu))
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.display_menu
  end

  def order_food(food, quantity)
    # fail "#{food} not available currently" if !@menu.display_menu
    @order.order_food(food, quantity)
    "#{quantity} order(s) of #{food} added to your cart"
  end

  def order_summary
    @order.order_summary
  end

  def confirm_order(total_confirmation)
    current = Time.now
    t = "#{current.hour + 1}:#{'%02d' % current.min}"
    fail "Incorrect total" if total_confirmation != @order.total
    "Thank you! Your order was placed and will be delivered before #{t}"
  end
end
