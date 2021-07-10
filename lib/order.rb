class Order
  attr_reader :basket
  def initialize
    @basket = []
  end

  def add_item(dish, quantity)
    quantity.times { @basket << dish}
  end
end