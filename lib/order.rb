require './lib/dish.rb'
require './lib/menu.rb'

class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def add(dish)
    @items << dish
  end

  def check
    items.length
  end

end
