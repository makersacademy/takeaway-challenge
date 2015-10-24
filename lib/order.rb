class Order

  attr_reader :items
  def initialize
    @items = Hash.new(0)
  end

  def add_item (name, quantity = 1)
    @items[name] += quantity
  end
end
