require_relative 'menu'

class Order

  attr_reader :customer_basket
  
  def initialize 
    @customer_basket = []
    @customer_basket_subtotal = []
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
        @customer_basket_subtotal << options[:price]
      end
    end
  end

  def customer_order
   puts @customer_basket
   puts @customer_basket_subtotal
  end


  def order_asker
    puts "What would you like to order? Enter an item number."
    @customer_choice = gets.chomp.to_i
  end

  def add_new_item
    @customer_choice = gets.chomp
      if @customer_choice == 'checkout' 
        return "thanks for ordering"
      elsif
        @customer_choice = @customer_choice.to_i
      end
    end

  def order_process
    puts "Welcome to #{@restaurant_name}"
    show_menu
    order_asker
    select_items(@customer_choice)
    customer_order
    puts "Enter another number or checkout to pay"
    add_new_item
    select_items(@customer_choice)
    customer_order
  end

end
