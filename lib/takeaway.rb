require './lib/menu.rb'
require './lib/dish.rb'

# create list of dishes
pad_kapow = Dish.new("pad kapow", 50)
pad_thai = Dish.new("pad thai", 50)
papaya_salad = Dish.new("som tum", 50)
green_curry = Dish.new("gaeng keow wan", 60)
tom_yum = Dish.new("tom yum goong", 70)
gaeng_som = Dish.new("gaeng som", 80)

# create menu and add all dishes to menu
@thai_menu = Menu.new
@thai_menu.add_dish(pad_kapow)
@thai_menu.add_dish(pad_thai)
@thai_menu.add_dish(papaya_salad)
@thai_menu.add_dish(green_curry)
@thai_menu.add_dish(tom_yum)
@thai_menu.add_dish(gaeng_som)

#create an empty order for the new customer
@customer_order = Menu.new

# customer interaction
puts "Welcome to the Thai Takeaway!"

def show_customer_choices
  puts "Choose your option below. Alternatively, press enter or 0 to quit:"
  puts "1 - view menu"
  puts "2 - create/add to an order"
  puts "3 - review order"
end

def show_menu
  puts "Please see our full menu:"
  @thai_menu.see_menu
end

def add_to_order
  choice = ""
  while true
    puts "Type the name of dish you would like to add to your order, or type 'finish' to stop adding dishes"
    choice = gets.chomp.downcase
    break if choice == "finish"
    matched = false
    @thai_menu.dishes.each { |dish|
      if choice == dish.name
        @customer_order.dishes << dish
        puts "#{dish.name} has been added to your order"
        matched = true
      end
    }
    puts "Sorry, we don't have that dish on our menu!" if matched == false
  end
end

def calculate_total
  total = 0
  @customer_order.dishes.each{ |dish|
    total += dish.price
  }
  total
end

def review_order
  puts "Your order so far:"
  @customer_order.see_menu
  puts "Total cost is #{calculate_total}"
end

def perform_customer_choice
  while true
    show_customer_choices
    choice = gets.chomp.to_i
    if choice == 0
      break
    elsif choice == 1
      show_menu
    elsif choice == 2
      add_to_order
    elsif choice ==3
      review_order
    else
      puts "option not recognised"
    end
  end
end

perform_customer_choice
