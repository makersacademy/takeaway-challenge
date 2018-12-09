require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_accessor :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

  def display_menu
    @menu.show_menu
  end

  def order(order = Order.new(@menu))
    @order = order
  end

  def price(order)
    order.summary << "The total for your order is: £#{order.total}"
  end

end
