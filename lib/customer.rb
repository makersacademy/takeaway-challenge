class Customer

  attr_reader :order

  def initialize
    @order = []
  end
  def add_to_order(dish, number = 1)
    number.times { @order << dish }
  end
end
