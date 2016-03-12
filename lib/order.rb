class Order
  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def basket
    @basket.dup
  end

  def add(dish, quant = 1)
    @basket[dish] += quant if @menu.contains? dish
  end

  def remove(dish, quant = 1)
    if @basket.include? dish
      if basket[dish] > 1
        @basket[dish] -= quant
      else
        @basket.delete dish
      end
    end
  end

  def total
    total = 0
    @basket.each do |dish, quant|
      total += (@menu.price dish) * quant
    end
    total
  end

  def complete_order(money)
    raise 'wrong amount' unless money == total
    true
  end
end
