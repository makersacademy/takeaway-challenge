require_relative 'restaurant'
require_relative 'menu'
require_relative 'dish'
require_relative 'order'
require_relative 'twilio_service'

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

  def place_order(order, customer_phone)
    raise 'Incorrect total, cannot complete order' unless correct_total?(order)

    @sms_service.send_sms(customer_phone, confirmation_message)
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

  def confirmation_message
    "Thank you! Your order was placed and will be delivered before #{est_arrival}"
  end

  def est_arrival
    (Time.now + 3600).strftime("%-I:%M%p")
  end
end
