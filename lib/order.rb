require_relative 'menu'

class Order

  attr_reader :selection, :dishes, :menu

def initialize
  @selection = {}
  @total = 0
  @menu = Menu.new
end

def add_order(dish, quantity)
 @selection[dish] = quantity
end

def dish_totals
  @selection.map do |dish, quantity|
    menu.price(dish) * quantity
  end
end

def order_total
  dish_totals.inject(:+)
end
end
