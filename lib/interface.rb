require_relative 'takeaway'

@store = Takeaway.new

def interactive_menu
  puts "Welcome to Pies'r'us. What can we offer you today?"
  loop do
    print_menu_interface
    process(STDIN.gets.chomp)
  end
end

def print_menu_interface
  
  puts "1. See the menu"
  puts "2. Add a dish to the order"
  puts "3. Check the order and pay"
  puts "4. Exit"
end

def process(selection)
  case selection
  when "1"
    print_menu
  when "2"
    add_to_order
  when "3"
    check_order
  when "4"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def print_menu

  @store.print_menu

end

def add_to_order

  puts "What do you want to take?"
  dish = gets.chomp
  puts "How many you want?"
  quantity = gets.chomp.to_i
  @store.add_to_order(dish, quantity)
  puts "#{quantity} #{dish} added to the order. Thank you."
  puts "Do you want anything else?"
    
end

def check_order

  @store.check_order
  puts "Do you want to pay? (Yes/No)"
  answer = gets.chomp
  return unless answer == "Yes"
  @store.send_message
  puts "Thanks for your order. Please press '4' to exit"

end

interactive_menu
