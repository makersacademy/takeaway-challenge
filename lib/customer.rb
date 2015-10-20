class Customer

  # def initialize(restaurantClass = Restaurant.new)
  #   @restaurant = restaurantClass
  # end

  def order restaurant, dish, amount
    restaurant.take_order dish, amount
  end

  def confirm_total restaurant, total
    restaurant.confirm_order total
  end

end
