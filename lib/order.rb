class Order

  attr_reader :order

  def initialize
    @order = []
  end

  def add(dish)
    @order << dish
  end

  def total
    total = 0
    @order.each { |dish| total += dish.price }
    total
  end

  def contents
    @order.map { |dish| dish.name }.join("\n")
  end

end
