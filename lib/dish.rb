class Dish
  attr_reader :name, :price, :qty
  def initialize(name, price, qty = 0)
    @name = name
    @price = price
    @qty = qty
  end

  def update_qty(qty)
    @qty = qty
  end
end
