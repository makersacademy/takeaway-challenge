require "dish_list"
require "sms_notifier"

class Order
  attr_reader :current_order

  def initialize
    @current_order = []
    @sms_client = Sms_notifier.new
  end

  def choose_dish(dish_name)
    dish_price = price(dish_name)
    store_dish(dish_name, dish_price)
  end

  def calculate_price
    total = 0
    @current_order.each do |_, price|
      total += price
    end
    total
  end

  def confirm_order
    time = (Time.now + 60 * 60).strftime("%H:%M")
    message = "Thank you! Your order was placed and will be delivered before #{time}"
    # @sms_client.send_message(message)
    p message
  end

  private

  def price(dish_name)
    return Restaurant::MENU[dish_name]
  end

  def store_dish(dish_name, dish_price)
    @current_order << [dish_name, dish_price]
  end
end
