require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize
    @menu = Menu.new
    @current_order = Order.new
  end

  def view_menu
    @menu.view
  end

  def add_to_order(num)
    @current_order.add(num)
  end

  def empty_basket
    @current_order = Order.new
    puts "Basket emptied"
  end

  def check_basket
    @current_order.view_basket
  end

  def submit_order
    @current_order.submit
  end

end
