require 'texter'

class Takeaway

DISHES = {:bacon => 2.50,
          :cheese => 1.00,
          :pizza => 5.00,
          :cake => 4.32,
          :carrots => 1.20,
          :pie => 2.00}

def initialize
  @order = []
  @order_value = 0
end

def view_dishes
  DISHES
end

def select_dish dish, quantity
  fail 'dish not on menu' unless on_menu? dish
  @order << [dish, quantity]
end

def on_menu? dish
  DISHES.has_key?(dish)
end

def order_total
  @order.each do |dish|
    @order_value += DISHES[dish[0]]*dish[1]
  end
  @order_value
end

def check_payment amount
  unless correct? amount
    fail 'incorrect payment amount'
  else
    'payment correct'
    Texter.send delivery_time
  end
end

def correct? amount
  amount == order_total
end

def delivery_time
  Time.now + 3600
end

def make_order
  puts "Choose dish and quantity (type finish to end order"
  puts "Dish?"
  dish = gets.chomp
  if dish != 'finish'
    puts "Quantity?"
    quantity = gets.chomp
    select_dish dish.to_sym, quantity.to_i
    puts "order comes to £#{order_total}"
    make_order
  else
    make_payment
  end
end

def make_payment
  puts 'Please input payment amount'
  amount = gets.chomp
  check_payment amount
end

end