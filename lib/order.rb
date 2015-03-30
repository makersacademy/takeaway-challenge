class Order
  attr_reader :items

  def initialize
    @items = {}
  end

  def add!(item, quantity)
    @items[item['dish']] = [item['price'], quantity]
  end

  def total_items
    @items.size
  end

  def cost
    @items.inject(0) { |sum, (_key, value)| sum += (value[0] * value[1]) }
  end
end
