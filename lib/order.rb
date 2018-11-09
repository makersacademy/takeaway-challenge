
require 'twilio-ruby'
require 'sms_config.rb'


class Order

  def initialize
    @dishes = Dishes.new
    @food_ordered = []
  end

  def order_food(ordered_food, quantity)
    quantity.times { @food_ordered << @dishes.dishes[ordered_food] }
    send_message
    return "#{ordered_food} ordered x #{quantity}"
  end

  def bill_amount
    return sprintf('%.2f', @food_ordered.sum)
  end

  def send_message
    delivery_estimate = (Time.new + (60 * 60)).strftime("%H:%M")
    SendMessage.new.send_message(bill_amount, delivery_estimate)
  end
end
