require_relative 'order'

class Menu

  attr_reader :menu

  def initialize
    @menu = [{ :name => "Risotto", :price => 7.99 },
      { :name => "Large Pizza", :price => 12.99 },
      { :name => "Fried Chicken", :price => 6.99 },
      { :name => "Green Salad", :price => 5.99 },
      { :name => "Pasta", :price => 8.99 },
      { :name => "Vegetable Curry", :price => 6.49 },
      { :name => "Rice", :price => 1.99 },
      { :name => "Steamed Vegetables", :price => 1.99 }]
  end

  def display_menu
    menu.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:name]}, Price: £#{item[:price]}"
    end
  end

  def display_order
    @new_order.orders.each_with_index do |index|
      @menu[index]
    end
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
    while !input.empty? do
      add_to_order(input)
      puts "#{@new_order.orders.count} items in order"
      input = STDIN.gets.chomp
    end
  end
  
  def add_to_order(x)
    @new_order.orders << x
  end

  def start_new_order
    @new_order = Order.new
  end

  def app
    print_welcome
    display_menu
    order_food
    input_order
  end
end

# start = Menu.new
# start.app