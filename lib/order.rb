class Order
  attr_reader :basket
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(dish, quant = 1)
    @basket[dish] += quant if @menu.contains? dish
  end

  def remove(dish, quant = 1)
    @basket[dish] -= quant if @basket.contains? dish
  end

  def total
    total = 0
    @basket.each do |dish, quant|
      total += (@menu.price dish) * quant
    end
    total
  end
end
