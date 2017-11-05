require_relative 'order'

private

def new_order
  @order = Order.new
end

def initial_menu
  puts "Wellcome to 'Cristhian's Take-away', what would you like to do?"
  puts '1- See dishes list and prices'
  puts '2- Make an order'
  puts '3- See your order and prices'
  puts '4- exit'
end

def choose
  selection = gets.chomp
  case selection
  when '1'
    print_menu
  when '2'
    make_order
  when '3'
    print_order
  when '4'
    say_goodbye
  end
end

def say_goodbye
  puts 'Thank you for comming, hope to see you soon'
  exit
end

def print_menu
  @order.asks_menu
  ask_for_action
end

def make_order
  ask_for_food
  @amount_of_dishes.times {@order.place_order(@wanted_dish.capitalize)}
  print_order
end

def default_print_init
  puts 'You have ordered'
end

def print_order
  default_print_init
  print_dishes
  ask_for_action
end

def ask_for_amount
  puts "How many #{@wanted_dish} you want?"
  calculate_amount
end

def calculate_amount
  @amount_of_dishes = gets.chomp.to_i
end

def print_dishes
  @order.ordered_list.each do |dishes_list|
    dishes_list.each_pair do |dish,price|
      puts "#{dish} ----> #{price}£"
    end
  end
  total_sum
end

def total_sum
  puts "The total price is #{@order.total_price}£"
end

def ask_for_action
  puts 'Would you like to order a new dish? (Y/N)'
  getting_answer
end

def getting_answer
  answer = gets.chomp
  make_order if answer.upcase == 'Y'
  initial_display unless complete_order?
end

def complete_order?
  puts "Is your order complete? (Y/N)"
  answer = gets.chomp
  return true if answer.upcase == 'Y'
  false
end

def ask_for_food
  puts 'What do you want to eat?'
  @wanted_dish = gets.chomp
  ask_for_amount
end

def initial_display
  initial_menu
  choose
end

public

def run_take_away
  new_order
  initial_display
end


run_take_away
