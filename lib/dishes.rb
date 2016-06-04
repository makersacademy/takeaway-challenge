class Dish

  attr_reader :item

  def initialize(name, price)
    @item = { :name => name, :price => price }
  end

  def name
    @item[:name]
  end

  def price
    @item[:price]
  end

end
