class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item item, quantity
    quantity.times { items << item }
  end

  def total
    total = 0
    items.each { |item| total += item.price }
    total
  end
end