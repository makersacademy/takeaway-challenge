require_relative 'menu'

class Order
  attr_reader :ordered_items

  def initialize
    @ordered_items = []
  end

  def add_dish(dish)
    @ordered_items << dish
  end
  
end