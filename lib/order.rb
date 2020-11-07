class Order
  attr_reader :dishes, :order
  def initialize
    @order = []
  end

  def add(dish, amount = 1)
    amount.times { @order << dish }
  end
end
