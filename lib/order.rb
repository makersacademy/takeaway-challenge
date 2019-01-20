class Order
  attr_reader :items

  def initialize
    @items = nil
  end

  def add(items)
    @items = items
    'Added to Basket'
  end
end
