require_relative 'menu'
require_relative 'dish'

class Order

attr_reader :basket, :menu

def initialize(menu = Menu.new)
  @basket = Hash.new(0)
  @menu = menu
end

def add_dish(name)
  @basket[name] += @menu.dishes[name]
end

def remove_dish(name)
  check_basket(name)
  @basket[name] -= @menu.dishes[name]
end

def view_basket
  check_empty_basket
  print_subtotals
  print_total
end

def place_order(payment, confirmation = Message.new)
  check_empty_basket
  review_payment(payment)
  thank_you(payment, confirmation)
end

private

def check_basket(name)
  raise "Dish is not in the basket" if @basket[name] <= 0 
end

def print_subtotals
  @basket.each do |name, price| 
      qty = (@basket[name] / @menu.dishes[name]).round
      puts "#{qty}x #{name} £#{price}"
  end
end

def checkout_total
  @basket.select { |_, price| price.positive? }.values.reduce(:+)
end

def print_total
  puts "----------------"
  puts "Order Total £#{checkout_total}"
end

def empty_basket?
  @basket.empty? || @basket.values.all? { |value| value <= 0 }
end

def check_empty_basket
  msg = "Your basket is currently empty. Please add item first."
  raise msg if empty_basket?
end

def review_payment(payment)
  msg = "Please enter the correct payment amount."
  raise msg if payment != checkout_total
end

def thank_you(payment, confirmation)
  confirmation.send_message if payment == checkout_total
end
end