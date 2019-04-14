require_relative 'menu'

class Takeaway
  def initialize(menu = Menu)
    @menu = menu.new
  end

  def view_menu
    @menu.show_menu
  end

  def new_order(order = Order)
    @order = order.new
  end
end
