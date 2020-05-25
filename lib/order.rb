require_relative 'menu'

class Order

  attr_reader :customer_basket, :customer_basket_subtotal
  
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
    order_asker
    raise "Invalid number, please choose again" if customer_choice > 3

    @menu.each do |choice|
      if customer_choice == choice[:item_number]
        customer_basket << choice
      end
    end
  end

  def customer_order_summary
    @customer_basket.each do |order|
      puts "#{order[:item]}, price £#{order[:price]}"
    end
  end
  
  def subtotal
    @customer_basket.each { |value| puts value[:price].to_i }
  end

  private
  
  def order_asker
    puts "Enter an item number or checkout to pay"
  end

end

  # def add_new_item
  #   @customer_choice = gets.chomp
  #     if @customer_choice == 'checkout' 
  #       return "thanks for ordering"
  #     elsif
  #       @customer_choice = @customer_choice.to_i
  #     end
  #   end

  # def order_process
  #   puts "Welcome to #{@restaurant_name}"
  #   show_menu
  #   order_asker
  #   select_items(@customer_choice)
  #   customer_order
  #   puts "Enter another number or checkout to pay"
  #   add_new_item
  #   select_items(@customer_choice)
  #   customer_order
  # end
