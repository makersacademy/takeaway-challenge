class Customer

  attr_accessor :restaurant

  def initialize
    @restaurant = Restaurant.new
  end

  def view_menu
    restaurant.menu
  end
end