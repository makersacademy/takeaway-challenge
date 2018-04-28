class CustomerOrder

  attr_reader :selection

  def initialize(dishes = Dishes.new)
    @dishes = dishes
    @selection = []
  end

  def select_dish(dish, quantity)
    @selection << [dish, quantity]
  end

end
