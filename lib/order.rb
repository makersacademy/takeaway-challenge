require './lib/menu.rb'
require './lib/confirm_order.rb'

class Order
  attr_reader :order_list, :total
  
  def initialize
    @menu = Menu.new
    @order_list = []
    @total = 0
  end
  
  def print_menu
    puts @menu.print_menu
  end

  def select_dish
    puts "Please type in the dish you want:"
    dish = gets.chomp
    @menu.dish_list.include?(dish) ? dish : select_dish
  end

  def select_quantity(dish)
    puts "How many #{dish}s do you want?"
    quantity = gets.chomp.to_i
  end

  def add_to_order(dish,quantity)
    quantity.times { order_list << dish }
  end

  def another_dish?
    puts "Do you want to select another dish? (y/n)"
    selection = gets.chomp
    selection == "y" ? order_item : nil
  end

  def order_item
    dish = select_dish
    quantity = select_quantity(dish)
    add_to_order(dish,quantity)
    another_dish?
  end

  def print_order_list
    puts @order_list
  end

  def sum_total
    @order_list.each do |item|
      puts "#{item} - #{@menu.price_list[item.to_sym]}"
      @total += @menu.price_list[item.to_sym]
    end
    puts "The sum of these is: #{@total}"
  end

  def confirm_order?
    puts "Do you want to confirm your order (y/n)"
    confirm = gets.chomp
    confirm == "y" ? complete_order : nil
  end

  def complete_order
    confirm_order = ConfirmOrder.new(Time.new,@order_list,@total)
  end

end
