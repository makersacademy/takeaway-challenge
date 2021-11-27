class Dish 
  attr_reader :name, :price, :qty

  def initialize(name = nil, price = nil)
    @name = name
    @price = price
    @qty = 0
  end

  def increase_qty
    @qty += 1
  end

  def decrease_qty
    @qty -= 1
  end

  def set_qty_to_0
    @qty = 0
  end

  def none_selected?
    @qty <= 0
  end

  def last_one?
    @qty == 1
  end
  
end