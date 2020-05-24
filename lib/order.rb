require_relative 'menu'

class Order

  attr_reader :customer_basket
  
  def initialize 
    @customer_basket = []
    @menu = Menu.new.menu_list
    @restaurant_name = Menu.new.take_away_name

  end

  def show_menu
    Menu.new.show_list
  end

  def select_items(customer_choice) 
    raise "Invalid number, please choose again" if customer_choice > 3

    @menu.each do |options|
      if customer_choice == options[:item_number]
        customer_basket <<  options[:item]
        return customer_basket
      end
    end
  end

  def start_order
    puts "Welcome to #{@restaurant_name}"
    show_menu
    order_asker
  end

  def customer_order
    @customer_basket
  end


  def order_asker
    puts "What would you like to order? Enter an item number."
    @customer_choice = gets.chomp.to_i
  end

end
