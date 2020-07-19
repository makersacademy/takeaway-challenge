class Dish
  attr_reader :name, :price
  def initialize(name, price)
    @name = name
    @price = price
  end
  def order(current_order = Order.new)
    current_order.add(self)
    "Added to order #{current_order}"
  end
end
