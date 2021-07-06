class MenuItem
  attr_reader :name, :price

  def initialize(dish: nil, cost: nil)
    # will set instance variables of the name and price of each dish
    @name = dish
    @price = cost
  end
end
