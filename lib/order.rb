class Order

  def initialize
    @items = []
  end

  def items
    @items.dup
  end

  def add_item(item)
    @items << item
  end

  def remove_item(item)
    @items.delete(item)
  end

end
