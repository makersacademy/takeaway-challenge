class Order

  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end

<<<<<<< HEAD
  def has_dish?
  end

=======
>>>>>>> 5b518b08298087d7c384d87ce4b9817b570e4534

end
