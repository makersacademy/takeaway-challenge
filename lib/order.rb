require "./lib/menu"

class Order

  def initialize
    @dishes = []
    @total_price = 0
  end

  def add(dish_name, quantity = 1)
    @dishes << { dish: dish_name, quantity: quantity }
  end

  def total_price
    10000
  end

end
