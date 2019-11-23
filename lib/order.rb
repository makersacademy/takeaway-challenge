class Order
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include? item
  end

  def view
    items_ordered.map { |order_item| order_item.name }
  end

  def total
    prices = items_ordered.map { |dish| dish.price }
    prices.reduce(&:+)
  end

  private

  def items_ordered
    @items
  end
end
