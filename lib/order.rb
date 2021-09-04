require_relative 'menu'

class Order
  attr_reader :current_order

  def initialize
    @menu = Menu.new
    @current_order = []
  end

  def view_menu
    @menu.list
  end

  def add_to_order(dish_number)
    @current_order << @menu.list[dish_number-1]
  end

  def total
    puts @current_order
    @current_order.map { |o| o.values }.flatten.sum
  end
end