require 'menu'
require 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
  end

  def enter
    "Welcome to our takeaway. To check out our menu, type in takeaway.display_menu"
  end

  def display_menu
    @menu.display
  end

  def create_order
    @order = Order.new
  end

end
