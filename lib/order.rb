class Order
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def total_price
    @dishes == [] ? 0 : @dishes.map { |dish| dish.price }.inject(:+)
  end

end
