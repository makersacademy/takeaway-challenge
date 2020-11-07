class Order
  def initialize
    @items = []
  end

  def add_item(item, quantity)
    quantity.times { @items.push(item) }
  end

  def total
    @items.map { |i| i.item_price }.sum
  end
end