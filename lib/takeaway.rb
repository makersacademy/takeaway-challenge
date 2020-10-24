require_relative 'dishes'

class Takeaway
  attr_reader :list_of_dishes, :current_order_completed, :current_order
  def initialize
    @list_of_dishes = ListOfDishes.new
    @current_order = Order.new
    @current_order_completed = false
    # @current_cost
  end

  def format_menu
    @list_of_dishes.menu_layout
  end

  def print_menu
    @list_of_dishes.print_menu
  end

  def take_order(dish, quantity)
    format_menu
    @current_order.dish_to_order = @list_of_dishes.all_dishes[dish - 1]
    @current_order.add_to_order(dish, quantity)
  end

  def show_current_order
    p "Your current order is #{@current_order}"
  end



end
