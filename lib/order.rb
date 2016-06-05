class Order

  attr_reader :items

  def initialize
    @items = {}
  end

  def add(item, quantity)
    items[item] = quantity
  end

end
