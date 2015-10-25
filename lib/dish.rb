class Dish
  attr_reader :description, :price
  def initialize(description:, price:)
    @description = description
    @price = price
  end

  def update_quantity(quantity)
    fail "Quantity is negative" if quantity < 0
    @quantity = quantity
  end
  def to_s
    "#{description}\t#{price}"
  end
end
