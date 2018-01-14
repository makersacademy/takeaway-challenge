class ShoppingCart
  attr_reader :total

  def initialize
    @total = 0
    @items = []
  end

  def add(dish)
    @items << dish
    @total += dish.price
    self
  end

  def remove(dish)
    @items.delete(dish)
    @total -= dish.price
    self
  end

  def empty
    @items = []
    @total = 0
    self
  end

  def items
    @items.dup
  end
end
