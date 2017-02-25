require_relative 'chinese'

class OrderConsole

  def initialize(restaurant = Chinese.new)
    @restaurant = restaurant
    puts "Welcome to the takeaway ordering application for #{restaurant.class}."
    puts "Type \"<OBJECT_NAME>.show_menu\" to view the menu."
  end

  def show_menu
    puts "Please pick your desired dishes from the following options:"
    @restaurant.restaurant_menu
  end

  def order
    my_order = gets.chomp
  end

end
