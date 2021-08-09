# Responsible for letting customer choose dishes
require_relative 'order'
require_relative 'confirmation'

class Restaurant
  attr_reader :menu, :current_order, :orders

  def initialize
    @menu = [
      ["Sushi", 7],
      ["Burger", 6],
      ["Fries", 3],
      ["Noodle Soup", 10],
      ["Bahn Mi", 9.25]
    ]
    @orders_history = []
    @current_order = Order.new
  end

  def see_menu
    puts "MENU".center(30, " -")
    @menu.each_with_index do |dish, index|
      menu_num = index + 1
      puts "#{menu_num}. #{dish[0]} £#{dish[1]}"
    end
  end

  def select_from_menu
    see_menu
    menu_num = ""
    until menu_num == 'finished'
      puts "Select a number from the menu to add to order"
      menu_num = STDIN.gets.chomp
      puts "You have selected #{menu_num}"
      if menu_num == "exit" 
        @current_order = Order.new
        see_menu
      elsif menu_num == "finished" 
        if @current_order.selection == []
          puts "You've not selected anything"       
        else
          complete_order
        end
      elsif /[[:alpha:]]/.match(menu_num)
        puts "Sorry, that's not on the menu"
      elsif menu[menu_num.to_i - 1]
        @current_order.add_to_order(menu[menu_num.to_i - 1])
        puts "I've added #{menu[menu_num.to_i - 1][0]} to your order"
        puts "Order cost: £#{current_order.cost_calculator}"
      else
        puts "Sorry, that's not on the menu"
      end
    end
  end

  def complete_order
    puts "Your order is as follows.\n#{current_order.selection} £#{current_order.cost_calculator}.\nWould you confirm? Y/N"
    STDIN.gets.chomp = Y ? current_order.order_to_kitchen : current_order = Order.new
  end

  private
  def select_dish(menu_num)
    # error if no arguments given
    raise "Sorry, that's not on the menu" if menu_num > menu.length

    @customer_selection << menu[menu_num - 1]
  end
end



