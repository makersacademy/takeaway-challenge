class Item
  attr_reader :price, :quantity
  def initialize(price = 0, quantity = 0)
    @price = price
    @quantity = quantity
  end

  def total
    @price * @quantity
  end
end
