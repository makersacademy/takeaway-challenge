require_relative 'menu'

class Order

  attr_reader :order_list

  def initialize(menu_instance)
    @menu = menu_instance
    @order_list = {}
  end

  def take_order
    puts "Enter 'Checkout' to complete the order"
    loop do
      menu_card
      puts "Enter dish number"
      dish = gets.chomp
      break if dish == "checkout"
      puts "Enter the quantity"
      qauntity = gets.chomp.to_i
      add_order(dish, qauntity)
    end
    
  end

  def total_amount
    total = 0
    @order_list.each do |k, v|
      total += @menu.display_menu[k] * v
    end

    return total

  end

  private

  def add_order(dish, quantity)
    single_order = {@menu.display_menu.keys[dish.to_i - 1] => quantity}
    @order_list.merge!(single_order)
    
  end

  def menu_card
    count = 0
    @menu.display_menu.each do |key, value|
      puts "#{count + 1}. #{key}, #{value}"
      count += 1
    end

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