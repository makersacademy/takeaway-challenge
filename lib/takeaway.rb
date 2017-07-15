require_relative 'menu'

class Takeaway

  def initialize
    @menu = Menu.new
    @new_order = Order.new
  end

  def view_menu
    @menu.print_menu
  end

  def order(*dish_and_quantity)
    (0...dish_and_quantity.length-1).step(2) do |n|
      fail "Sorry, we do not serve #{dish_and_quantity}" unless @menu.dishes.key?(dish_and_quantity[n])
    end
    # fail "Sorry, we do not serve #{dish_and_quantity}" if not_on_menu
    @new_order.add_dish(dish_and_quantity)
    @new_order.dishes
  end

  # def not_on_menu
  #   order(dish_and_quantity).step(2).each do |dish|
  #     return true if !@menu.dishes.key?(dish)
  #   end
  # end

end
