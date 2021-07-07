class Order

  attr_reader :food 

  def initialize
    @food = {}
  end

  def add(dish, num)
    food[dish] = num
  end

  def total
    food.each do |dish, num|
        food.price(dish) * num
    end
    return total
  end


end
