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

  def place_order(order)
    raise 'Incorrect total, cannot complete order' unless correct_total?(order)
  end

  private

  def correct_total?(order)
    actual_total = order.basket.map {
      |item| find_dish(item[:dish]).price * item[:qty] }.reduce(:+)
    actual_total == order.total
  end

  def find_dish(dish)
    @restaurant.find_dish(dish.name)
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
