require_relative 'menu'

class Order

attr_reader :menu, :order, :total_price

def initialize(menu)
  @menu = menu
  @order = {}
  @total_price = 0
end

def add_dish(dish, qty)
  @order[dish] = qty
  # add_order_price
end

def add_order_price(price, qty)
  puts @order[dish]
  # @total_price += @order
end

def total_price
  @total_price
end

end
