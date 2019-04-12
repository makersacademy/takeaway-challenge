class Dish
  attr_reader :name, :price, :id

  def initialize(id, name, price)
    @name = name
    @price = price
    @id = id
  end

  def print_dish
    "#{id}: #{name} ------- #{price}"
  end
end
