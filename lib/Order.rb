require_relative 'Menu.rb'

# This new class is going to create an order
class Order

  def order(dish, amount)
    basket[dish] += amount
  end

end