require 'prices'

class FoodItem
  attr_accessor :name, :price, :item_full, :prices
  def initialize
    @name
    @price
    @item_full
  end

  def add_item(name)
    @name = name
    find_price(name)
    add
  end

  def find_price(name)
    @price = Prices.const_get(name.to_s.upcase)
  end

  def add
    @item_full = {food: @name, price: @price}
  end

end
