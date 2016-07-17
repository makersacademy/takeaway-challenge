require_relative 'menu'

class Takeaway
attr_reader :basket

def initialize(menu = Menu.new)
  @basket = {}
  @menu = menu
end

def read_menu
  @menu.list
end

def order(dish, number = 1)
  fail "#{dish} is not on the menu. Sorry!" unless @menu.contain?(dish)
  fail "Order value must be more than 0" if number < 1
  @basket.has_key?(dish) ? @basket[dish] += number : @basket[dish] = number
  puts "#{number} x #{dish} added to your order!"
end

def check_order
  @basket.each do |key, value|
    puts "#{key} x #{value} : £#{Menu::DISHES[key]*value}"
  end
    puts "TOTAL : £#{total}"
end

def total
  @basket.inject(0) { |sum, (dish,quantity)| sum + Menu::DISHES[dish]*quantity }
end

def checkout(total_price)
  fail 'Please enter the correct total to checkout' if total_price != total
  puts "Your order has been received!"
end

end
