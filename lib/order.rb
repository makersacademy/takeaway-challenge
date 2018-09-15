class Order
  attr_reader :summary

  def initialize
    @summary = []
  end

  def add(dish, quantity)
    @summary << { name: dish.name, price: dish.price, quantity: quantity }
  end
end
