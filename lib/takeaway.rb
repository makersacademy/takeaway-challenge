require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    menu
  end

  def place_order(item, qty)
    order
  end

end
