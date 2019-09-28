require 'dish'

class Order
  attr_reader :ordered_items

  def initialize
    @ordered_items = []
  end

  # add(dish_name, quantity = 1)

  def add_item(dish, quantity = 1)
    ordered_items << {dish: dish, quantity: quantity}
  end
  # if dish already ordered, ordering again would update the quantity
  # print
  # remove(dish)

end