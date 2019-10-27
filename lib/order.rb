require_relative 'display'

class Order

  def initialize(restaurant, display = Display.new)
    @display = display
    @restaurant = restaurant
  end

  def request_menu
    @display.menu(@restaurant)
  end

end
