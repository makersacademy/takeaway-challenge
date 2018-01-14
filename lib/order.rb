class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def add_items(item,quantity,cost)
    @items << { item: item, quantity: quantity, cost: cost}
  end
end
