class Order
  attr_reader :basket, :item
  def initialize
    @basket = []
  end

  def add_to_basket(item, quantity)
    @basket [item] += quantity
  end

end
