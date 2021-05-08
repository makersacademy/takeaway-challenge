class Dish
  def initialize(name:, price:)
    @name = name
    @price = price
  end

  def to_s
    "#{@name} - #{@price}"
  end
end
