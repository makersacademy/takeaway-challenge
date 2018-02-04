require_relative 'menu'
require_relative 'order'

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

  def checkout(amount)
    if amount == @order.total
      send_text
    else
      raise "Incorrect amount, please check order total"
    end
  end

  def send_text

  end

end
