require_relative 'restaurant'
require_relative 'menu'
require_relative 'dish'

class Takeaway
  attr_reader :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
  end

  def print_menu
    puts @restaurant.menu.format
  end
end

@takeaway = Takeaway.new(
  Restaurant.new(
    Menu.new(
      Dish.new('Tom yum soup', 4.50),
      Dish.new('Pad thai', 8.95),
      Dish.new('Pad see yew', 8.95),
      Dish.new('Egg fried rice', 3.89),
    )
  )
)
