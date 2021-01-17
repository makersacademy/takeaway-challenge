require_relative 'order'
require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = nil
  end

  def view_menu
    @menu.display_menu
  end

  def place_order
    @order = Order.new
  end

end
