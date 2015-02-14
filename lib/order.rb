class Order

  attr_accessor :dishes, :total

  def initialize
    @dishes = []
    @total = 0
  end

  def add(dish)
    dishes << dish
  end

  def sum
    dishes.each { |dish| @total += dish.price }
  end


end