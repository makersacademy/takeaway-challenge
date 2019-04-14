require_relative 'menu'
require_relative 'order'
require_relative 'TextNotifier'

class Restaurant

  attr_reader :menu
  attr_reader :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def checkout
    fail "empty basket" if @menu.basket.empty?
    @order.current_order.concat(@menu.basket)
    @menu.basket.clear
  end

  def confirm_order
    fail "no order created" if @order.current_order.empty?
    TextNotifier.new.send
  end
end
