# Stores the quantity and details of the dishes selected
require './lib/dish.rb'

class Cart

  def initialize
    @basket = []
  end

  attr_reader :basket

  def select_dish(dish, quantity)
    selection = {}
    selection[:name] = dish.name
    selection[:price] = dish.price
    selection[:quantity] = quantity
    return selection
  end

  def add_to_basket(dish, quantity)
    selection = select_dish(dish, quantity)
    basket.push(selection)
  end



end
