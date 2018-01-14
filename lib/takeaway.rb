require_relative 'menu'
require_relative 'order'
require_relative 'sms_tool'

class Takeaway

  attr_reader :menu, :order_history

  def initialize(menu = Menu.new, order_class = Order, sms_tool = SmsTool.new)
    @menu = menu
    @order_history = []
    @order_class = order_class
    @sms_tool = sms_tool
  end

  def print_menu
    menu.print_menu
  end

  def order_item(item, quantity = 1)
    fail "Sorry, we do not sell #{item}" unless menu.item_available?(item)
    current_order.add_items(item, quantity, menu.items[item])
  end

  def complete_order(user_total)
    fail "Total does not match current order, order not processed" unless current_order.verified?(user_total)
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
  end

  def send_confirmation_sms
    @sms_tool.send_message
  end

end
