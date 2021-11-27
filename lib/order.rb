class Order
  attr_reader :items

  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end
end