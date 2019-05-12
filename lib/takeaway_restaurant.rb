require_relative 'dish'
require_relative 'message_service'

class TakeawayRestaurant
  attr_reader :menu

  def initialize(dishes, message_service)
    @menu = dishes
    @message_service = message_service
  end

  def order(dishes_and_portions, expected_total)
    total = calculate_total(dishes_and_portions)
    raise "Total is not correct" if total != expected_total

    time_now = Time.now
    delivery_time_str = (time_now + 3600).strftime("%H:%M")
    @message_service.send_message\
    "Thank you! Your order was placed and will be delivered before" + \
    delivery_time_str
  end

  private

  def calculate_total(dishes_and_portions)
    dishes_and_portions.map do |dish_and_portion|
      dish_and_portion[:dish].price * dish_and_portion[:portion]
    end.sum
  end
end
