class Order

  attr_accessor :dishes, :price, :total

  def initialize
    @dishes = []
    @price = 5
    @total = 0
  end

  def add(dish)
    dishes << dish
  end

  def sum
    dishes.each { |dish| @total += dish.price }
  end

end