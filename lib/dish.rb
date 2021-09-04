class Dish
  attr_reader :name, :price, :hash

  def initialize(name = "Hash brown", price = 99)
    @name = name
    @price = price
    @hash = {}
  end

  def dish_hash
    @hash[@name.to_sym] = (@price / 100.0).to_s
    @hash
  end
end
