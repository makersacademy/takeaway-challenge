require 'dish'

class Order
  attr_accessor :ordered_dishes

  def initialize
    @ordered_dishes = []
  end

  # add to order(dish_name, quantity = 1)
  # show_order
  # remove(dish)

end