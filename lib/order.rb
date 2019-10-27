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

  def view_basket
    @display.basket(self)
  end

  def request_item(name)
    @basket << @restaurant.hold_portion_of_requested_dish(name)
  end

  def basket_total_price
    @sum = 0
    @basket.each do |dish|
      dish.each do |name, price|
        @sum += price
      end
    end
    @sum
  end

end
