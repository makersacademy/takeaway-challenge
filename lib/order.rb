require_relative 'menu'

class Order

attr_reader :menu, :order, :total_price

def initialize(menu)
  @menu = menu
  @order = {}
  @total_price = 0
end

def add_item(dish, qty = 1)
  @order[dish].to_i == 0 ? @order[dish] = qty : @order[dish] = @order[dish].to_i + qty
  add_order_price(dish.price, qty)
end

private

def add_order_price(price, qty)
  @total_price += price * qty
end

end
