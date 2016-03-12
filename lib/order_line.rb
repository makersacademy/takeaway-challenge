class OrderLine
  attr_reader :dish, :qty, :total

  def initialize(dish: nil, qty: nil)
    @dish = dish.name
    @qty = qty
    @total = dish.price * qty
  end
end
