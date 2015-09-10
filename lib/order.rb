class Order
  attr_reader :meals

  def initialize 
    @meals = []
  end

  def add meal, quantity
    order = quantity.times.map{meal}
    @meals.concat order
  end

  def total
    @meals.inject (0) { |mem, meal| mem + meal.price }
  end

end