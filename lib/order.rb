class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(dish)
    basket << dish
  end

  def remove(dish)
    basket.delete(dish)
  end

  def total
    basket.map { |dish| dish.price }.inject(:+)
  end

end
