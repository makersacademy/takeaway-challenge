class Order

  attr_accessor :basket, :prices

  def initialize
    @basket = {}
    @prices = []
  end

  def add(dish, price, quantity)
    basket_manager(dish, quantity)
    @prices << (price * quantity).to_f.round(2)
  end

  def sum
    @prices.inject(0, :+)
  end

  private

  def basket_manager(dish, quantity)
    if @basket.has_key?(dish)
      @basket[dish] += quantity
    else
      @basket[dish] = quantity
    end
  end

end
