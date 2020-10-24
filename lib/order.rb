class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def select(dish)
    @items << dish
  end

  def total
    @items.map { |dish| dish.price }.sum
  end

  def receipt
    @items.map { |x| ["#{x.name} - £#{x.price}" ] }.push("Total: £#{total}")
  end

end
