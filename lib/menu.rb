require_relative 'order'

class Menu

  attr_reader :menu

  def initialize
    @menu = [{ :name => "Risotto", :price => 7.99 },
      { :name => "Large Pizza", :price => 12.99 },
      { :name => "Fried Chicken", :price => 6.99 },
      { :name => "Green Salad", :price => 5.99 },
      { :name => "Pasta", :price => 8.99 },
      { :name => "Vegetable Curry", :price => 6.99 },
      { :name => "Rice", :price => 1.99 },
      { :name => "Steamed Vegetables", :price => 1.99 },
      { :name => "Acai Bowl", :price => 3.99 }]
  end

  def display_menu
    menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]}, Price: £#{item[:price]}"
    end
  end

  def display_order
    order_total = 0
    puts "Order summary"
    @new_order.orders.each do |item|
      puts @menu[item - 1][:name]
      puts "£#{@menu[item - 1][:price]}"
      order_total += @menu[item - 1][:price]
    end
    puts "Your total is £#{order_total}"
  end

  def print_welcome
    puts "Welcome to Sergei's takeaway"
  end

  def order_food
    puts "Enter the number of the menu item to add to your order."
    puts "To finish your order, hit return twice."
  end

  def input_order
    start_new_order
    input = STDIN.gets.chomp
    # if input =~ /^-?[0-9]+$/
    until input.empty? do
      add_to_order(input)
      display_items_in_order
      input = STDIN.gets.chomp
    end
  end

  def display_items_in_order
    puts "#{@new_order.orders.count} items in order"
  end
  
  def add_to_order(item)
    @new_order.orders << item.to_i
  end

  def start_new_order
    @new_order = Order.new
  end

  def app
    print_welcome
    display_menu
    order_food
    input_order
    display_order
    @new_order.order_confirmation
  end
end

start = Menu.new
start.app
