require_relative 'display'

class Order
  attr_reader :basket
  def initialize(restaurant, display = Display.new)
    @display = display
    @restaurant = restaurant
    @basket = []
  end

  def request_menu
    @display.menu(@restaurant)
  end

  def request_item(name)
    @basket << @restaurant.hold_portion_of_requested_dish(name)
  end

end
