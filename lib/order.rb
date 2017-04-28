class Order
  attr_reader :items
  
  def initialize
    @items = Hash.new(0)
  end

  def order_item(item, quantity)
    items[item] += quantity
  end
end
