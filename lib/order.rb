class Order

  def initialize(cart, restaurant)
    @cart = cart
    @restaurant = restaurant
  end

  def calculate_total
    @cart.list.map {|item| item.price }.inject(:+)
  end

end
