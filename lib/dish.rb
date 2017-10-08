class Dish
  attr_reader :name, :price_per_unit
  attr_accessor :quantity_ordered
  def initialize name, price_per_unit, quantity_ordered = 0
    @name = name
    @price_per_unit = price_per_unit
    @quantity_ordered = quantity_ordered
  end
end
