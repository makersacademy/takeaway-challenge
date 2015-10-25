class Dish
  attr_reader :description, :price
  def initialize(description:, price:)
    @description = description
    @price = price
  end

  def to_s
    "#{description}\t#{price}"
  end
end
