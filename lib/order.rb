class Order
  attr_reader :contents
  def initialize
    @contents = []
  end

  def add(dish)
    @contents << dish
  end

  def remove(dish)
    @contents.delete(dish)
  end

  def cost
    total_cost = 0
    @contents.each do |dish|
      total_cost += dish.dish_cost
    end
    total_cost
  end
end
