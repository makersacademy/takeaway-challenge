class Order

  attr_reader :list

  def initialize
    @list = Array.new
  end

  def add(dish, quantity)
    @list << {dish: dish, quantity: quantity}
  end

  def total
    total = 0
    @list.each do |item|
      price, quantity = item[:dish].price, item[:quantity]
      total += price * quantity
    end
    total
  end

end
