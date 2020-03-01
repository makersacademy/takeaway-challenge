require_relative "order"
require_relative "menu"
class Takeaway
  attr_reader :menu_var, :current_order
  def initialize(menu = Menu.new)
    @current_order = nil
    @menu_var = menu
  end

  def print_menu
    @menu_var.see_menu
  end

  def create_order(current_order = Order.new)
    @current_order = current_order
    puts "Please add to this order by using add_to_order(ITEM, quantity) "
  end

  def add_to_order(item, quantity)
    @current_order.order << { item: item, quantity: quantity }
  end

  def check_order
    @current_order.print_order
    puts "Once you are ready to finish ordering type .finish_order"
  end

  def finish_order
    puts "Thanks for your order you will receive a text with your delivery time"
    @current_order.end_order
    @current_order = nil
  end
end
