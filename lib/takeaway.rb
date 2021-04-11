require_relative 'dishes'
require_relative 'order'

class Takeaway
  attr_reader :list_of_dishes, :current_order_completed, :current_order
  def initialize
    @list_of_dishes = ListOfDishes.new
    @current_order = Order.new
    @current_order_completed = false
    @current_cost = 0
  end

  def format_menu
    @list_of_dishes.cost_per_dish
    @list_of_dishes.menu_layout
  end

  def print_menu
    format_menu
    @list_of_dishes.print_menu
  end

  def take_order(dish, quantity)
    format_menu
    @current_order.dish_to_order = @list_of_dishes.all_dishes[dish - 1]
    @current_order.add_to_order(@current_order.dish_to_order, quantity)
    @current_order.cost_of_dish = @list_of_dishes.price_of_dishes[dish - 1]
    @current_order.cost(quantity)
  end

  def show_current_order
    return "You haven't ordered anything yet" unless order_started?

    return "Your current order is: #{@current_order.customer_order}"
  end

  def order_started?
    @current_order.order_started
  end

  def cost_of_order
    @current_order.order_cost
  end

  def finish_order
    @current_order.order_completed = true
    return "Your order is #{show_current_order}, which comes to a total of £#{cost_of_order}"
  end

end
