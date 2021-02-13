class Order
  attr_reader :items_ordered, :items_price
  def initialize
    @items_ordered = []
    @items_price = []
  end

  def add(item, quantity = 1)
    add_items(item, quantity)
  end

  private

  def add_items(item, quantity)
    quantity.times { @items_ordered << item }
  end
end
