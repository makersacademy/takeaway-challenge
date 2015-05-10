require_relative 'order'

@order = Order.new

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. read the input and save it into a variable
    process(STDIN.gets.chomp)
    # 3. do what the user has asked
  end
end

def print_menu
  puts "\n"
  puts ''.ljust(32, '-')
  @order.print_dishes
  puts ''.ljust(32, '-')
  puts "\n"
  puts '7. Show order total so far'
  puts '8. Confirm order, send SMS'
  puts '9. Cancel order'
end

def process(selection)
  case selection
    when ('1'..'5')
      @order.add(selection.to_i, 1)
     when '7'
       puts "Your order is $#{@order.total} so far"
     when '8'
       notify
     when '9'
       exit # this will cause the program to terminate
     else
       puts "I don't know what you meant, try again"
  end
end

def notify
  @order.notify
  exit
end

interactive_menu
