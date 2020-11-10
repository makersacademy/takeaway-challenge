require_relative './menu.rb'
require_relative './order.rb'

class TakeAway

  attr_reader :order, :menu

  def initialize
    @menu = Menu.new
  #  @order = order
  end

  # def order
  #   @order
  # end

  def new_order
    @order = Order.new
    @menu.print_menu
  end

  def add_item(dish, quantity)
    @order.add(dish, quantity)
  end

  def place_order
    puts "Your order has been placed"
  end

end
