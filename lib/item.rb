class Item
  DEFAULT_NAME = "MISSING NAME".freeze
  DEFAULT_PRICE = 0

  attr_reader :name, :price

  def initialize(name = DEFAULT_NAME, price = DEFAULT_PRICE)
    @name = name
    @price = price
  end

end
