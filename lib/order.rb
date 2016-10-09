require_relative 'menu'

class Order

attr_reader :current_order, :total_price, :menu

def initialize
  @current_order = {}
  @total_price = 0
  @menu = Menu.new
end

def add_item(dish, quantity)
  @current_order[dish] = quantity
  puts "You have added #{quantity} x #{dish}(s) to your order"
end

end
