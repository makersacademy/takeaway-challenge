
require_relative 'text'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_dishes
    menu.show_dishes
  end

  def place_order(*dishes)
    order.place_order(dishes)
  end


end
