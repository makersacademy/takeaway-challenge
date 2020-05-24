require './lib/takeaway.rb'
class Order
  attr_reader :items
  def initialize
    @items = {}
  end

  def add_dish(dish, quantity = 1)
    @items[dish] = 0 unless items[dish]
    @items[dish] += quantity
  end
end
