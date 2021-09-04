require_relative 'menu'

class Order
  attr_reader :current_order

  def initialize
    @menu = Menu.new
    @current_order = []
  end

  def view_menu
    @menu.list.each { |d| puts "#{d[:dish_number]}: #{d[:dish]}" + d[:cost].to_s.rjust(5) }
  end

  def add_to_order(dish_number)
    @current_order << @menu.list[dish_number-1]
  end

  def remove_from_order(dish_number)
    @current_order.delete_if { |d| d[:dish_number] == dish_number }
  end

  def total
    @current_order.each { |d| puts "#{d[:dish_number]}: #{d[:dish]}" + d[:cost].to_s.rjust(5) }
    @current_order.sum { |d| d[:cost] }
  end
end
