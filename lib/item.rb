# initialize item takes a name and a price and stores
class Item
  def initialize(name, price)
    @item_name = name
    @item_price = price
  end

  # return name
  def name
    @item_name
  end

  # return price
  def price
    @item_price
  end

end
