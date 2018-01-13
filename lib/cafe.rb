require_relative 'order'
require_relative 'menu'

class Cafe

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def read_menu
    @menu.show
    ask_for_order
  end

  def order_me(item)
    @order.add_to_order(item)
    "You have ordered #{item}."
  end

  private

  def ask_for_order
    "What would you like to order?"
  end

end
