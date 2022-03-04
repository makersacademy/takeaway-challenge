require_relative 'menu'

class Order

  attr_reader :dishes_ordered

  def initialize(menu_instance)
    @menu = menu_instance
    @dishes_ordered = {}
  end

  def take_order
    puts @menu.display_menu
    puts "Enter the dish you want to order"
    dish = gets.chomp
    puts "Enter the quantity"
    qauntity = gets.chomp.to_i
    add_order(dish, qauntity)
  end

  def add_order(dish, quantity)
    single_order = {dish => quantity}
    @dishes_ordered.merge!(single_order)
  end
  
end