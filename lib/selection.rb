class Selection
  attr_reader :dish_name, :quantity

  def initialize(dish_name, quantity)
    raise ArgumentError, 'selection dish name must not be empty' if dish_name.empty?
    raise ArgumentError, 'selection quantity must be greater than 0' if quantity <= 0

    @dish_name = dish_name.to_sym
    @quantity = quantity
  end
end
