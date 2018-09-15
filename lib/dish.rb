class Dish

  attr_reader :name, :price, :item
  def initialize(name, price)
    @price = price
    @name = name
  end

  def item
    @item = { @name => @price }
  end
end
