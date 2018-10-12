class Order
  attr_reader :basket
  
  def initialize
    @basket = Hash.new(0)
  end

  def add_items(item, quantity)
    @basket[item] += quantity
  end

end
