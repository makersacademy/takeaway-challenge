require 'dish'

class Item < Dish
  attr_reader :dish, :qty

  def initialize(dish, qty)
    @dish = dish
    @qty = qty
  end
end
