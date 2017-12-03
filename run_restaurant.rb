require "./lib/restaurant"

def welcome_menu
  puts "Please choose an option"
  puts "1. View menu"
  puts "2. Place order"
  puts "3. Exit"
end

def interactive_menu
  welcome_menu
  process(STDIN.gets.chomp)
end

def process(selection)
  @restaurant = Restaurant.new
  case selection
    when "1"
      @restaurant.print_menu
      interactive_menu
    when "2"
      @order = @restaurant.place_order
      get_choice
    when "3"
      exit
    else
      puts "I don't know what you meant, try again."
      interactive_menu
  end
end

def get_choice
  puts "What would you like to order?"
  @choice = STDIN.gets.chomp.capitalize
  if !@order.menu.include?(@choice)
    puts "Item not on menu"
    get_choice
  else
    get_quantity
  end
end

def get_quantity
  puts "How many would you like?"
  @quantity = STDIN.gets.to_i
  @order.add(@choice, @quantity)
  add_another
end

def add_another
  puts "Do you want to add another dish? (y/n)"
  input = STDIN.gets.chomp.downcase
  if input == "y"
    get_choice
  elsif input == "n"
    complete?
  else
    puts "I don't know what you meant, try again."
    add_another
  end
end

def complete?
  puts "Do you want to complete your order? (y/n)"
  input = STDIN.gets.chomp.downcase
  if input == "n"
    get_choice
  elsif input == "y"
    @order.basket_summary
    @order.total
    @order.check_totals
    @restaurant.confirm_order
  else
    puts "I don't know what you meant, try again."
    complete?
  end
end

interactive_menu
