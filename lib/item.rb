class Item

  attr_reader :name, :price

  def initialize(name, price)
    @name = name.to_sym
    @price = price
  end

end
