class Order

  def initialize
    @items = Hash.new(0)
  end

  def add(dish, quantity = 1)
    @items[dish] += quantity
  end

  def display_basket
    @items
  end
end
