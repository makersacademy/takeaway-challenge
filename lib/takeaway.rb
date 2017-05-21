class Takeaway

  attr_reader :interface

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
    @interface = Interface.new
  end

end
