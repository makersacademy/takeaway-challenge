require "./lib/dish.rb"

class Order

  attr_reader :items, :total

  def initialize
    @items = []
    @total = []
  end

  def add_to_order(dish = Dish.new, quantity)
    counter = 0
    while counter < quantity
      @items << dish
      @total << dish.price
      counter += 1
    end
  end

  def give_total
    @total.inject(:+)
  end
end
