class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def add(item = nil,quantity = 1)
    item == nil && (fail "you must pass an item")
    
    @items << {item: item, quantity: quantity}
  end
end