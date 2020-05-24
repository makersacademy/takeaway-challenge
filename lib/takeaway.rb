require_relative 'menu'

class TakeAway
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def menu
    @menu.show_menu
  end

  def order
    @order.request_order
  end
end
