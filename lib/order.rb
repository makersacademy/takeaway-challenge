class Order

  def initialize
    @baske = []
    @cost = 0
  end

  def basket
    @baske.dup
  end

  def add_item(dish, number)
    number.times{@baske << dish}
  end

  def calc_total
    @baske.each{ |dish| @cost += dish.price}
    @cost
  end

end
