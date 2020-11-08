require_relative 'restaurant'
require_relative 'basket'

class Takeaway

  attr_reader :restaurant, :basket

  def initialize(restaurant = Restaurant.new, basket = Basket.new)
    @restaurant = restaurant
    @basket = basket
  end

  def see_menu
    @restaurant.show_menu
  end

  def order(item, quantity = 1)
    # infinite inventory :: quantity not an argument in check_availability
    raise StandardError.new "Sorry, the #{item} is not on the menu." if !restaurant.check_availability(item)
    basket.add_to_basket(item, quantity)
  end

end