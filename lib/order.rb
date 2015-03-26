class Order

  attr :basket

  def initialize
    @basket = {}
  end

  def add_dish(dish, quantity)
    @basket[dish] = quantity
  end

  def total_cost
    total = 0
    @basket.each do |dish, quantity|
      total += dish.price * quantity
    end
    total
  end

end