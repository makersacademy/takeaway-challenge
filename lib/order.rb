class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def save_order(order_item)
    @items << order_item
  end

end
