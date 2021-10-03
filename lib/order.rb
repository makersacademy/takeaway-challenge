class Order
  attr_reader :dishes_ordered

  def initialize
    @dishes_ordered = []
  end

  def add(dish)
    @dishes_ordered << dish
  end
end
