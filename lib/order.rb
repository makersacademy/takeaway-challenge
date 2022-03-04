require_relative 'menu'

class Order

  attr_reader :order_list

  def initialize(menu_instance)
    @menu = menu_instance
    @order_list = {}
  end

  def take_order
    puts @menu.display_menu
    puts "Type 'add' to add to order or 'Checkout' to complete the order"
    loop do
      puts "Enter the dish you want to order"
      dish = gets.chomp
      puts "Enter the quantity"
      qauntity = gets.chomp.to_i
      add_order(dish, qauntity)
      break if gets.chomp == "Checkout"

    end
    
  end

  def add_order(dish, quantity)
    single_order = {dish => quantity}
    @order_list.merge!(single_order)
    
  end

  def write_order
    file = File.open("order_list.txt", "w")
    @order_list.each do |dish, quantity|
      order_array = [dish, qauntity]
      txt = order_array.join(" => ")
      file.puts txt
    end
    file.close
  end
  
end