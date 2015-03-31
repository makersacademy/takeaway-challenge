require_relative 'order'
require_relative 'dish_list'
require_relative 'menu'
require_relative 'display_output'
require_relative 'twilio_api'

class Takeaway
  include DisplayOutput
  CURRENT_LEAD_TIME_IN_MINS = 60
  SECONDS_IN_MINUTE = 60
  def initialize
    @order = Order.new
    @dish_list = DishList.new
    @menu = Menu.new dish_list
  end

  def add_item item_code, quantity = 1
    item = dish_list.lookup(item_code.to_sym)
    order.add_item(item, quantity)
  end

  def view_menu
    menu.show_menu
  end

  def view_order
    header = ['Order code', 'Name', 'Price']
    display_list header, order.items, true
  end

  def order_total
    order.total
  end

  def confirm_order
    send_sms
  end

  private

  attr_reader :order, :dish_list, :menu

  def send_sms
    message = "Thanks for your order. Your total is "
    message += "£#{convert_price(order_total)} and your "
    message += "food should be with you by #{estimated_time}"
    message_sender.send_message message
  end

  def message_sender
    TwilioAPI.new
  end

  def estimated_time
    (Time.new + order_time).strftime("%I:%M%p")
  end

  def order_time
    CURRENT_LEAD_TIME_IN_MINS * SECONDS_IN_MINUTE
  end
end