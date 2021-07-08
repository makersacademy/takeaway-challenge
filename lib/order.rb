
class Order

  attr_reader :items

  def initialize
    @items = []
  end

  def order(item)
    @items << item
  end
end
