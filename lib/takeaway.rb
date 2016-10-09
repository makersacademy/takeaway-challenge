require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :see_menu, :order, :checkout_pricer

  def initialize
    @menu =  Menu.new
    @order = Order.new
    message_to_user
  end

  def see_menu
    @menu.menu_list
  end

  def make_an_order(item)
    @order.select_dish(item)
    puts "You have selected #{@menu.menu_list[item - 1]}"
    @order.current_order
  end

  def checkout_price
    @order.total_price
  end

  def message_to_user
    puts "Welcome to our Takeaway app!"
  end

end
