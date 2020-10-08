class Basket
  attr_reader :dishes
  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end

  def total_price
    total = 0
    @dishes.each { |dish| total += dish.price}
    total
  end
end