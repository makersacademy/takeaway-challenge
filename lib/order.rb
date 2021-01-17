class Order

  attr_reader :orders, :order

  def initialize
    @orders = []
  end
  
  def add(dish, quantity, price)
    @orders << { dish: dish, quantity: quantity, price: price }
  end

  def total
    calculation
  end

  private

  def calculation
    total = 0
    @orders.each do |hash|
      total += (hash[:quantity] * hash[:price])
    end
    total
  end

end
