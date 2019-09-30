require_relative 'print_menu'

class Order

  attr_reader :current_order

  def initialize(print_menu_class = PrintMenu)
    @current_order = []
    @print_menu_class = print_menu_class.new
  end

  def add_order(dish_number, quantity)
    dish_number = dish_number - 1
    quantity.times { @current_order << @print_menu_class.select_dish(dish_number) }
    puts "#{quantity} order(s) of #{@current_order[-1][:dish]} added to your basket"
  end

end
