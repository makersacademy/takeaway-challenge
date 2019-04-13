require_relative 'menu'

class Order

  attr_reader :selection

def initialize
  @selection = {}
end

def add_order(dish, quantity)
  @selection[dish] = quantity
end

end
