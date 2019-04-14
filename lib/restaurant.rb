require_relative 'menu'
require_relative 'order'

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
end
