require_relative 'restaurant'
require_relative 'menu'
require_relative 'dish'
require_relative 'order'

class TakeawayService
  attr_reader :restaurant, :sms_service

  def initialize(sms_service, restaurant)
    @sms_service = sms_service
    @restaurant = restaurant
  end

  def print_menu
    puts @restaurant.format_menu
  end

  def create_order(order = Order.new(@restaurant))
    order
  end
end

# @takeaway = TakeawayService.new(
#   TwilioService.new,
#   Restaurant.new(
#     Menu.new(
#       Dish.new('Tom yum soup', 4.50),
#       Dish.new('Pad thai', 8.95),
#       Dish.new('Pad see yew', 8.95),
#       Dish.new('Egg fried rice', 3.89)
#     )
#   )
# )
