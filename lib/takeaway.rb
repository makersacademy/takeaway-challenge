require_relative 'menu'
require_relative 'dish'
require_relative 'order'
require_relative 'sms'

class Takeaway

  attr_reader :current_order, :list, :menu

  def initialize
    @menu = Menu.new
  end

  def view_menu
    menu.view_menu
  end

  def create_order
    @current_order = Order.new
  end

  def select_dish(number)
    fail "Please create an order before selecting dishes" if !@current_order
    current_order.add_dish(number, menu)
  end

  def proceed_to_checkout
    current_order.print_basket
  end

  def place_order
    current_order.place_order
  end

end
