require_relative 'menu'
require_relative 'order'

class Takeaway

  WELCOME = 'Welcome to the chip shop! Would you like to see our menu?'

  attr_reader :menu

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_class = order_class
  end

  def welcome
    WELCOME
  end

  def show_menu
    @menu.show_menu
  end

  def enter_order(menu_items)
    @order_class.new(menu_items)
  end

end
