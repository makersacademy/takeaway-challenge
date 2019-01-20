class Dishes

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price.to_f.round(2)
  end

end
