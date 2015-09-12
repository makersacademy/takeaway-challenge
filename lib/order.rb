require_relative 'menu'

class Order

  attr_reader :ordered_dishes

  def initialize
    @ordered_dishes = []
  end

  def add_to_order(dish,quantity)
    add_to_order  = {dish:dish,quantity:quantity}
    @ordered_dishes << add_to_order
  end

end
