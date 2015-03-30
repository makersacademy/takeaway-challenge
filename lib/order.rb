class Order
  attr_reader :items

  def initialize
    @items = {}
  end

  def add(item)
    @items[item['dish']] = item['price']
  end

  def total_items
    @items.size
  end

  def cost
    @items.inject(0) { |sum, (_key, value)| sum += value }
  end
end
