class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def add(item =nil)
    item == nil && (fail "you must pass an item")
    
    @items << item
  end
end