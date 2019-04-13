require_relative 'menu'

class Order
attr_reader :order, :menu, :dishes, :selection

def initialize(menu)
  @selection = {}
  @menu = menu
end

def add_order(dish, quantity)
  @selection[dish] = quantity
end

end
