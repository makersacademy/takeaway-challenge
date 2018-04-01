class Menu
  attr_reader :dishes

  def initialize
    @dishes = {'curry' => 1.00, 'pasta' => 3.00, 'basta' => 2.50}
  end

  def add(dish, price)
    @dishes.store(dish, price)
    dishes
  end

  def delete(dish)
    @dishes.delete(dish)
    dishes
  end
end
