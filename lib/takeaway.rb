require_relative 'menu'
require_relative 'order'
require_relative 'messages'

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
    fail "#{food} not available" if !@menu.display_menu[food]
    @order.order_food(food, quantity)
    "#{quantity} order(s) of #{food} added to your cart"
  end

  def order_summary
    @order.order_summary
  end

  def confirm_order(total_confirmation, text_message = Messages.new)
    fail "Incorrect total" if total_confirmation != @order.total
    @text_message = text_message
    messages
    @order = Order.new(menu)
    "Your order has been placed"
  end

  private

  def messages
    @text_message.send_message
  end
end
