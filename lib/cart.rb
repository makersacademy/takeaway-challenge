# Allows users to select dishes from menu in a quantity they specify

require './lib/menu.rb'

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

  def add_to_basket(dish_number, quantity)
    selection = select_dish(dish_number, quantity)
    basket.push(selection)
  end

  def checkout
    order = Order.new
    basket.each do |dish|
      order.summary << dish
    end
    order
  end



end
