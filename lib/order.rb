class Order

  attr_reader :basket
  DEFAULT_QUANTITY = 1

  def initialize
    @basket = []
  end

  def add_order(item, quantity = DEFAULT_QUANTITY)
    quantity.times { @basket << item }
  end

end
