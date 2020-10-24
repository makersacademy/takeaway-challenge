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

  def print_receipt
    receipt = Receipt.new(@items, total)
    receipt.print
  end

end
