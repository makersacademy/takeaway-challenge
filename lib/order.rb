require_relative 'menu'

class Order

  attr_reader :menu, :total_order, :bill

  def initialize(menu = Menu.new)
    @total_order = []
    @menu = menu
  end

  def input
    puts "Enter item number:"
    input = gets.chomp.to_i
    filter(input)
  end

  def filter(input)
    if input.between?(1, 6)
      add(input)
    else
      puts "Please enter a valid number"
      get_input
    end
  end

  def add(input)
    total_order << @menu.loaded_menu[input - 1]
    puts "#{@menu.loaded_menu[input.to_i - 1][:name]} added to your order"
    order_complete
  end

  def order_complete
    puts "Would you like to add to your order? (y/n)"
    answer = gets.chomp
    if answer == "y"
      input
    elsif answer == "n"
      nil
    else
      puts "Try again"
      order_complete
    end
  end
end
