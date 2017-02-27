# Shows list of menu items that user cannot edit - done

require_relative 'restaurant'

class Menu

  def initialize(restaurant = Restaurant.new)
    @restaurant = restaurant
  end

  def view
  @restaurant.menu.dup # Formatting could be nicer
  end
end
