require "./lib/takeaway.rb"
require "./lib/dish.rb"
require "./lib/customer.rb"
require "./lib/order.rb"
require "./lib/twilio.rb"

phone = Phone.new

takeaway = Takeaway.new("Chutney in Putney")

dish1 = Dish.new("Chicken Rogan Josh", 600)
dish2 = Dish.new("Pilau Rice", 300)
dish3 = Dish.new("Naan Bread", 200)
dish4 = Dish.new("Aloo Saag", 500)
dish5 = Dish.new("Gobi Manchurian", 600)

takeaway.add_dish(dish1)
takeaway.add_dish(dish2)
takeaway.add_dish(dish3)
takeaway.add_dish(dish4)
takeaway.add_dish(dish5)

takeaway.return_menu

order = Order.new(takeaway)

p "made it here"

# order.add_to_order(dish1,1)
# order.add_to_order(dish1,1)
# order.add_to_order(dish2,1)
# order.add_to_order(dish3,3)
#
# p "and here!"
# order.get_price
#
# order.complete_order(6)
#
# order.view_order
puts "welcome to #{takeaway.name}!"



def order_food(order)
  ordering = true
  while ordering do
    puts "Enter the id of the type of food you want to add to your order (from the menu)"
    food_array_pos = gets.chomp.to_i - 1
    if food_array_pos < order.takeaway.menu.count
      order_item = order.takeaway.menu[food_array_pos]
    else
      fail("Pick an id from the menu")
    end
    puts "Enter the quantity of this dish you want to order"
    quantity = gets.chomp.to_i
    order.add_to_order(order_item, quantity)
    puts "Do you want to order more (y/n)?"
    ordering = false if gets.chomp == "n"
  end
end


def show_options
  puts "Choose from the following (enter the number)"
  puts "1: See the menu"
  puts "2: Add to order"
  puts "3: Show total price"
  puts "4: Show order so far"
  puts "5: Complete order"
  puts "9: exit"
end

def complete_order(number_of_items,order)
  order.complete_order(number_of_items)
end


loop do
  show_options
  case gets.chomp.to_i
  when 1
    puts "============ MENU ==============="
    takeaway.return_menu
    puts "================================="
  when 2
    order_food(order)
  when 3
    puts order.get_price
  when 4
    order.view_order
  when 5
    puts "Ebnter the number of items you think you are getting"
    n = gets.chomp.to_i
    order.complete_order(n, phone)
  when 9
    break
  else
    puts "try again"
  end
end
