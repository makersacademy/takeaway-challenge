class Order
  def initialize(item)
    @items = item
  end

  def items
    @items.dup
  end

  def total
    sum = 0
    @items.each { |item| sum += item.price }
    sum
  end

end