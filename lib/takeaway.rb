# Uncomment to use twilio api
# require_relative 'twilio_api'
require_relative 'order_time'
require_relative 'menu'

class Takeaway
  def initialize(ordertime_class = OrderTime, menu = Menu.new, twilio_api = TwilioAPI.new)
    @ordertime_class = ordertime_class
    @menu = menu
    @twilio_api = twilio_api
  end

  def begin_order
    @menu.start
  end

  def select(item_name, quantity = 1)
    @menu.select(item_name, quantity)
  end

  def complete_order(value)
    raise "Cannot complete order: Incorrect Value" unless correct?(value)

    @twilio_api.send("Thank you, your order was placed and will be delivered before #{confirm_time}")
    # "Thank you, your order was placed and will be delivered before #{delivery_time}"
  end

  def print_menu
    @menu.print_menu
  end

  def print_current_order
    @menu.print_current_order
  end

  private

  def confirm_time
    confirm_time = @ordertime_class.new
    confirm_time.delivery_time
  end

  def correct?(value)
    value == @menu.order_price
  end
end
