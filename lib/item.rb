class Item

  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
    @avaialble = true
  end

  def available?
    @avaialble
  end

end
