class Order

  def initialize
    @items = []
  end

  def items
    @items.dup
  end

  def add_item(item)
    @items << item
    item
  end

  def remove_item(item)
    @items.delete(item)
  end

  def total
    @items.inject(0) { |sum, item| sum += item.price.to_f }
  end

end
