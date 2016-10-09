require_relative 'menu.rb'

class Order

def initialize
  @customer_selection = []
end

def add_item(choice)
  menu = Menu.new
  @customer_selection << menu[0] if choice == "1"
  @customer_selection << menu[1] if choice == "2"
  @customer_selection << menu[2] if choice == "3"
  @customer_selection << menu[3] if choice == "4"
  @customer_selection << menu[4] if choice == "5"
  @customer_selection << menu[5] if choice == "6"
  @customer_selection << menu[6] if choice == "7"
  @customer_selection << menu[7] if choice == "8"
  puts "Not a valid choice!"
end
end
