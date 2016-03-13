class Order

  def initialize
    @baske = []
  end

  def basket
    @baske.dup
  end

  def add_item(dish)
    @baske << dish
  end

  def calc_total
    cost = 0
    @baske.each{ |dish| cost += dish.price}
    cost
  end

end
