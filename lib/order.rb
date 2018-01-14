class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def add_items(item,quantity)
    @items << { item: item, quantity: quantity }
  end
end
