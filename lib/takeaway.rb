require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :total
  attr_reader :avail_dishes, :current_order
  attr_accessor :order

  def initialize
    @menu = Menu.new
    @order = nil
  end

  def place_order
    @order = Order.new
  end

  def view_order
    @order.total
    @order.print_basket
  end

  def finish_order
    
  end

  def view_menu
    @menu.customer_view
  end

end
