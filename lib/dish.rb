class Dish

  def initialize(dish_id, name, price)
    @id = dish_id
    @name = name
    @price = price
  end

  attr_reader :id, :name, :price

end
