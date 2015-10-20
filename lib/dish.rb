class Dish

  attr_reader :name, :price

  def initialize(name, price)
    @name = name.to_s.capitalize
    @price = price.to_f.round(2)
  end

end