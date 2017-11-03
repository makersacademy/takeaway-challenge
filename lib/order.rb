class Order
 attr_reader :cart, :total

  def initialize
    @cart = Hash.new { |hash, key| hash[key] = 0 }
    @total = 0
  end

  def add(dish, quantity)
    @cart[dish] += quantity
    @total += dish.price * quantity
  end
end
