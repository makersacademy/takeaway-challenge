class Order

  attr_reader :items

  def initialize
    @items = Hash.new(0)
  end

  def add_dish(dish, quantity = 1)
    @items[dish] += quantity
  end

end
