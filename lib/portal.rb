require_relative 'order.rb'
$VERBOSE = nil
@menu = ["1. Show me the menu", "2. Add to order","3. Take away from order", "4. Show order", "5. Finalise Order","9. Exit"]
@@order = Order.new

def print_header
  puts "Sam's Chish and Fippy "
  puts "--------------------"
end

def print_menu
  puts "\n"
  @menu.each do |item|
    puts item
  end
end

def process(selection)
  selection == "9" ? exit : puts("You chose: \n #{@menu[selection.to_i-1]}")
  case selection
  when "1"
    print_header
    MENU.display
  when "2"
    MENU.display
    puts "Select which one you would like to order"
    input_1 = gets.chomp
    @@order.add(input_1)
  when "3"
    @@order.list_order
    input_1 = gets.chomp
    @@order.add(input_1)
  when "4"
    @@order.list_order
  when "5"
    @@order.submit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

interactive_menu


