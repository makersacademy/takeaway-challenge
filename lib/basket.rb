require_relative 'order'
require_relative 'basket'

class Basket

attr_reader :cart, :total, :menu

def initialize
  @cart = {}
end

def add_to_basket(item)
  restaurant = Restaurant.new
  fail "Not on the menu!!!!!" if !restaurant.menu.has_key?(item.to_sym)
  cart[item.to_sym] = restaurant.menu[item.to_sym]
end

def view_basket
  puts "Total of order is £#{total}"
  cart
end

def empty
  cart.clear
end

def total
  total = 0
  cart.each do |item, price|
  total += price
  end
  "%.2f" % total
end

end
