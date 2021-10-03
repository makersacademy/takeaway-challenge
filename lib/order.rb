class Order
  attr_reader :items, :total
  def initialize
    @items = []
    @total = 0
  end

  def add(item = nil,quantity = 1)
    item == nil && (fail "you must pass an item")
    increase_total(item.price, quantity)
    @items << {item: item, quantity: quantity}

  end

  private
  def increase_total(price,quantity)
    @total += price * quantity
  end
end