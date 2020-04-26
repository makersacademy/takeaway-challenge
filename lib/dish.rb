class Dish
  attr_reader :item, :price

  def initialize(item, price)
    @item = item
    @price = price
  end

  def to_s
    "Item: #{@item} | Price: #{@price}"
  end
end
