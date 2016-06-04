class Dish

  attr_reader :item

  def initialize(name, price)
    @dish = { name: name, price: price }
  end

  def name
    @dish[:name]
  end

  def price
    @dish[:price]
  end

end
