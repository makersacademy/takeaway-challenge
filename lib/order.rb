require_relative 'menu.rb'
require_relative 'send_text.rb'

class Order

  attr_reader :start_program, :menu_class, :menu

  def initialize(menu_class = Menu)
    @menu_class = menu_class
    @start_program = ask_for_order
  end

  def ask_for_order
    @menu = @menu_class.new
    @menu.menu_load
    puts "To view the menu enter '.view menu' to make a order enter
      '.make order(dish name, quantity)'"
    puts "once you have made your order run confirm with the total"
  end

  def view_menu
    @menu.view_menu
  end

  def make_order(dish_name, quantity)
    @menu.dish_check(dish_name, quantity)
  end

  def confirm(amount)
    total = 0.00
    @menu.current_order.each do |dish|
      puts "#{dish.quantity}. #{dish.name} Price: £#{dish.price}"
      total += (dish.quantity * dish.price)
    end
    if total.round(2) == amount
      mob = Mobile.new
      mob.send_text
    else
      raise "not the right money"
    end
  end

end
