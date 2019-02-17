class Customer

  attr_reader :order

  def initialize
    @order = []
  end

  def add_to_order(dish, number = 1)
    number.times { @order << dish }
  end

  def order_total
    total = 0
    @order.each { |dish| total += dish.price }
    total
  end
end
