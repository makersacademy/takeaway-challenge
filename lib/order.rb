require_relative 'menu'

class Order

  def initialize menu
    @menu = menu
    @basket = []
  end

  def add(dish, amount)
    @basket.push([dish, amount])
  end

  def total
    total = 0
    @basket.each do |selection|
      key = selection[0]
      value = selection[1]
      amount = @menu.price_of(key) * value
      total += amount
    end
    total
  end

  def size
    @basket.size
  end
end