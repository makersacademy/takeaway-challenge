require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
    @new_order = Order.new
  end

  def view_menu
    @menu.print_menu
  end

  def order(dish, quantity)
    @new_order.add_dish(dish, quantity)
    @new_order.dishes
  end

end
