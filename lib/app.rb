$: << "."
require 'menu'
require 'order'

class App

  def initialize
    @menu = Menu.new
    @order = Order.new(menu: @menu)
  end

  def get_option
    puts "Type the number to choose your option: "
    puts "1 - View Menu"
    puts "2 - Add dishes to your basket"
    puts "3 - See your current basket"
    puts "4 - Checkout"
    puts "0 - Exit"

    return gets.chomp
  end

  def start
    option = get_option
    while option != "0"
      case option
      when "1"
        @menu.view_menu
      when "2"
        add_dish_to_basket
      when "3"
        @order.view_basket
      when "4"
        @order.checkout

        puts "New empty order created"
        @order = Order.new(menu: @menu )
      else
        puts "Option not found"
      end
      option = get_option
    end
  end

  private

  def add_dish_to_basket
    puts "Dish Id?"
    id = gets.chomp.to_i
    puts "Quantity?"
    quantity = gets.chomp.to_i
    dish = @menu.get_dish_by_id(id)
    @order.add_item(dish, quantity)
  end

end

App.new().start
