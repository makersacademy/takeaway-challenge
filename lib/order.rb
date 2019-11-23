class Order
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def items_ordered
    @items
  end

  def total
    prices = items_ordered.map { |dish| dish.price }
    prices.reduce(&:+)
  end
end
