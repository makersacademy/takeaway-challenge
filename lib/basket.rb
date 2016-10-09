require_relative 'order'
require_relative 'basket'

class Basket

  attr_reader :cart

def initialize
  @cart = {}
end

def add_to_basket(item)
  @menu = Restaurant.new
  fail "Not on the menu!!!!!" if !@menu.menu.has_key?(item.to_sym)
  @cart[item.to_sym] = @menu.menu[item.to_sym]
end

def view_basket
  puts "Total of order is #{total}"
  @cart
end

def total
  @total = 0.00
  @cart.each do |item, price|
  @total += price
  end
  "%.2f" % @total
end



end
