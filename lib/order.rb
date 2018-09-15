class Order
  attr_reader :dishes
  
  def initialize
    @dishes = []
  end

  def select_dish(dish, quantity)
    @dishes << { dish: dish, quantity: quantity }
  end
end
