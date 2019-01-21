
class Order
  def initialize
    @meal_order = []
  end

  def order_food(dish, quantity)
    @meal_order << {:dish => dish, :quantity => quantity }
  end

  def print_order
    p @meal_order
  end

 def total_cost
    sum = 0
    @meal_order.each do |item|
      sum += @menu.menu[item[:dish]] * item[:quantity]
    end
    sum
  end

end

