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
end
