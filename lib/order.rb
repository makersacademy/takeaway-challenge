class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item item, quantity
    quantity.times { items << item }
  end

  def total
    items.inject(0) { |memo, item| memo + item.price }
  end
end