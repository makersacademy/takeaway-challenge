class Order
  attr_reader :items 
  def initialize 
    @items = []
  end

  def add_to_cart(item)
    items.push item
  end 
end 