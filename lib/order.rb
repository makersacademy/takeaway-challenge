require_relative 'menu'

class Order

attr_reader :menu, :order

def initialize(menu)
  @menu = menu
  @order = {}
end

def add_dish(dish, qty)
  @order[dish] = qty
end

end
