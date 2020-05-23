require_relative 'menu'
require_relative 'order'
require_relative 'delivery'

class Resturant

  attr_reader :dishes, :order, :menu

  def initialize(menu_class = Menu)
    @menu = menu_class.new
  end

  def view_menu
    menu.show_menu
  end

  def start_order(order_class = Order)
    @order = order_class.new(@menu)
  end

  def cancel_order
    @order = nil
  end

  def add_to_order(dish, quantity = 1)
    order_being_placed?

    @order.add(dish, quantity)
  end

  def remove_from_order(dish, quantity = 1)
    @order.remove(dish, quantity)
  end

  def view_order
    order_being_placed?

    @order.view_order
  end

  def checkout
    print_order_at_checkout
    delivery if user_input.upcase == "Y"
  end

  private

  def delivery
    Delivery.new
  end

  def print_order_at_checkout
    puts "Order:"
    @order.view_order
    puts "Proceed with checkout?(Enter Y to proceed)"
  end

  def user_input
    STDIN.gets.chomp
  end

  def order_being_placed?
    fail "order not started" if !order
  end

end
