class Basket
  attr_reader :items
  def initialize
    @items = {}
  end
  def add(item, qty)
    has?(item) ? items[item] += qty : items[item] = qty
  end
  def remove(item, qty)
    raise "Item is not in basket" unless has?(item)
    items[item] <= qty ? items.delete(item) : items[item] -= qty
  end
  def has?(item)
    items.include?(item)
  end
end
