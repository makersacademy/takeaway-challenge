require_relative 'menu'
require_relative 'order'
require_relative 'text'

class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def show_menu
    menu.print
  end

  def create_order(order = Order.new)
    @order = order
  end

  def checkout(amount, text = Text.new)
    message = "Please see basket summary for the correct order total"
    raise message unless correct?(amount)
    text.send
  end

  private

  def correct?(amount)
    amount == order.total
  end

end
