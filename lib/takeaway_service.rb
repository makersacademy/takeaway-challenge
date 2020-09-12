require_relative 'restaurant'
require_relative 'menu'
require_relative 'dish'

class TakeawayService
  attr_reader :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
  end

  def print_menu
    puts @restaurant.format_menu
  end
end

@takeaway = TakeawayService.new(
  Restaurant.new(
    Menu.new(
      Dish.new('Tom yum soup', 4.50),
      Dish.new('Pad thai', 8.95),
      Dish.new('Pad see yew', 8.95),
      Dish.new('Egg fried rice', 3.89),
    )
  )
)
