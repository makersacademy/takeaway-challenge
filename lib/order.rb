require_relative 'menu'

class Order

attr_reader :current_order, :total_price, :dishes

def initialize
  @current_order = {}
  @total_price = 0
  @menu = Menu.new
  @dishes = dishes
end

def add_item(dish, quantity=0)
  @current_order[dish] = 0 unless current_order[dish]
  @current_order[dish] += quantity
  puts "You have added #{quantity} x #{dish}(s) to your order"
end



end
