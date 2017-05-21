require_relative 'menu'
require_relative 'order'
require_relative 'notifier'

class Restaurant

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def checkout
    @order.current_order.concat(@menu.basket)
    @menu.basket.clear
    "Your chosen items have been moved to your order!"
  end


  def send_SMS
    Notifier.new if @order.order_total != nil
  end


end
