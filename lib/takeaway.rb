require_relative 'menu'
require_relative 'notifier'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order, :notifier

  def initialize(menu = Menu.new, notifier = Notifier.new, order = Order.new)
    @menu = menu
    @notifier = notifier
    @order = order
  end

  def display_menu
    @menu.read_menu
  end

  def create_order
    @menu.take_order
  end

  def complete_order(price)
    @order.finalize_order(price)
  end

  def send_text
    notifier.send_message
  end

end
