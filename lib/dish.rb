class Dish
  attr_reader :name, :price, :item

  def initialize(name, price)
    @name = name
    @price = price
    @item = {:name => @name, :price => @price}
  end
end