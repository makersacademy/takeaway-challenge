class Item
  attr_reader :name, :price, :quantity

  def initialize(name, price)
    @name = name
    @price = price
    @quantity = 0
  end

  def add_to_order(number_of_items)
    @quantity += number_of_items
  end
end