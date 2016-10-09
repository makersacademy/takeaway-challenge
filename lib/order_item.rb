class OrderItem
  attr_reader :item, :quantity

  def initialize(item, quantity = 1)
    @item = item
    @quantity = quantity
  end
end
