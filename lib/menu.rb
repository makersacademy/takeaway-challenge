class Menu

  attr_reader :name, :price, :dish

  def initialize(name, price)
    @name = name
    @price = price
    @dish = { name: name, price: price }
  end

end
