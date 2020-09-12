require_relative "dish"
require_relative "menu"
require_relative "message"
require_relative "messenger_stand_in"
require "date"

class Order
  def initialize(menu, messenger = MessengerStandIn.new)
    @menu = menu
    @customer_selection = []
    @messenger = messenger
  end

  def add(dish_name, quantity)
    dish = @menu.get_dish(dish_name)
    store_to_order(dish, quantity)
  end

  def total
    total = 0
    @customer_selection.each { |dish|
      total += dish.price
    }
    return total
  end

  def place_order(phone_number)
    time = Time.now
    delivery_time = (time + (60 * 60)).strftime "%H:%M"
    confirmation_message = "Thank you for your order! It will be delivered by #{delivery_time}."
    @messenger.send_message(phone_number, confirmation_message)
  end

  private

  def store_to_order(dish, quantity)
    quantity.times { @customer_selection << dish }
  end
end
