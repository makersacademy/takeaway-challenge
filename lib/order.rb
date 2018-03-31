class Order
  attr_reader :basket, :prices
  def initialize
    @basket = {}
    @prices = []
  end

  def add(dish, price, quantity)
    basket_adder(dish, quantity)
    quantity.times { @prices << price }
  end

  def total
    @prices.reduce(:+)
  end

  private

  def basket_adder(dish, quantity)
    if @basket.include?(dish)
      @basket[dish] += quantity
    else
      @basket[dish] = quantity
    end
  end
end
