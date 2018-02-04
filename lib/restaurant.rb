require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    @menu.print
  end

  def create_order(order = Order.new)
    @order = order
  end

  def checkout(amount, text = Text.new)
    raise "Incorrect amount, please check order total" if amount != @order.total
    text.send
  end

end
