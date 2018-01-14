require_relative 'menu'
require_relative 'order'
require_relative 'sms_tool'

class Takeaway
  include SmsTool
  attr_reader :menu, :order_history

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_history = []
    @order_class = order_class
  end

  def print_menu
    menu.print_menu
  end

  def order_item(item, quantity)
    fail 'Sorry, we do not sell this dish' unless menu.item_available?(item)
    current_order.add_items(item, quantity, menu.items[item])
  end

  def verify_order(user_total)
    fail "Total does not match current order, order not processed" unless user_total == current_order.total
    log_and_complete
    send_confirmation_sms
  end

  private

  def current_order
    @current_order ||= @order_class.new
  end

  def log_and_complete
    order_history << current_order
    @current_order = nil
    "Total verified - order processed"
  end

  def send_confirmation_sms
    SmsTool.send_message
  end

end
