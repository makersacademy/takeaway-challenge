
class Item

  # initializes a new item, takes a name and a price and stores
  def initialize(name, price)
    @item_name = name
    @item_price = price.to_f
  end

  # Returns the item's name
  def name
    @item_name
  end

  # Returns the item's price
  def price
    @item_price
  end

end
