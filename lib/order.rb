require_relative 'menu.rb'

class Order

  attr_reader :start_program, :menu_class, :menu, :input

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @start_program = ask_for_order


  end

  def input=(input = gets.chomp)
    @input = input
  end

  def ask_for_order
    @menu = @menu_class.new
    @menu.menu_load
    puts "To view the menu enter '.view menu' to make a order enter '.make order(dish name, quantity)'"
    puts "once you have made your order run confirm with the total"
  end

  def view_menu
    @menu.view_menu
  end

  def make_order(dish_name, quantity)
    @menu.temp_dishes.each do |dish|
      if dish.name == dish_name
        @menu.quantity_checker(quantity, dish)
      elsif dish == @menu.temp_dishes[-1]
        puts "There is no dish with that name"
      end
    end
  end

  def confirm(amount)
    total = 0.00
    @menu.current_order.each do |dish|
      puts "#{dish.quantity}. #{dish.name} Price: #{dish.price}"
      total += (dish.quantity * dish.price)
    end
    if total == amount.to_f
      puts "confirm order"
    else
      puts "wrong amount"
    end
  end

end
