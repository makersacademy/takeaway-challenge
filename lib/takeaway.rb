require_relative 'twilio_api'
require_relative 'order_time'
require_relative 'menu'


class Takeaway
  attr_reader :current_order

  def initialize(ordertime_class = OrderTime, menu = Menu.new)
    @ordertime_class = ordertime_class
    @menu = menu
    @twilio_api = TwilioAPI.new
  end

  def begin_order
    @menu.start
  end

  def select(item_name, quantity = 1)
    @menu.select(item_name, quantity)
  end

  def complete_order(value)
    if value == @menu.order_price
      @twilio_api.send("Thank you, your order was placed and will be delivered before #{confirm_time}")
      # "Thank you, your order was placed and will be delivered before #{confirm_time}"
    else
      raise "Cannot complete order: Incorrect Value"
    end
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
end