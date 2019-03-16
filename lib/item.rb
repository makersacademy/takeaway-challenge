class Item
  attr_reader :price, :quantity, :name
  def initialize(name = "Extra", price = 0, quantity = 0)
    @name = name
    @price = price
    @quantity = quantity
  end

  def total
    @price * @quantity
  end
end
