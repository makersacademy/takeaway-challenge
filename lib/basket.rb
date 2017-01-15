class Basket
  attr_reader :items
  def initialize
    @items = {}
  end
  def add(item, qty)
    has?(item) ? items[item] += qty : items[item] = qty
  end
  def remove(item, qty)
    raise item_missing_error unless has?(item)
    items[item] <= qty ? items.delete(item) : items[item] -= qty
  end
  def has?(item)
    items.include?(item)
  end
  
  private
  def item_missing_error
    "Item is not in basket"
  end
end
