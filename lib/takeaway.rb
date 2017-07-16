require_relative 'menu'

class Takeaway
  attr_reader :open_orders

  def initialize
    @menu = Menu.new
    @new_order = Order.new
    @open_orders = []
  end

  def view_menu
    @menu.print_menu
  end

  def order(*dish_and_quantity)
    check_on_menu(dish_and_quantity)
    @new_order.add_dish(dish_and_quantity)
    @open_orders << @new_order.dishes
  end

  def check_on_menu(dish_and_quantity)
    (0...dish_and_quantity.length-1).step(2) do |dish|
      fail "Sorry, we do not serve #{dish_and_quantity}" unless @menu.dishes.key?(dish_and_quantity[dish])
    end
  end

end
