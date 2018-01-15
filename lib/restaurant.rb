require_relative 'messenger'
require_relative 'menu'
require_relative 'order'
require 'twilio-ruby'

class Restaurant

  def initialize(menu = Menu.new, messenger = Messenger.new, order = Order.new)
    @menu = menu
    @order = order
    @messenger = messenger
  end

  def read_menu
    @menu.read
  end

  def order(dish, quantity = 1)
    @order.add(dish, quantity)
  end

  def order_summary
    @order.summary
  end

  def check_total(user_total)
    @order.check_total(user_total)
  end

  def confirm_order
    @messenger.confirm_order
  end
end
