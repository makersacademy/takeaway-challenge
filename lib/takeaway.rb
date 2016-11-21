require_relative 'order'
require_relative 'menu'
require_relative 'sms'

class Takeaway
  ACCOUNT_SID = 'AC1e23ec21dbfbe55dca0adb3687afdfe0'
  AUTH_TOKEN = '612c426da5038b7a02cc2e7786143f8d'
  TWILIO_PHONE = '+441782454810'
  RECEIVER = '+447702602704'

  def initialize(menu:, order: nil, sms: nil, config: {account_sid: ACCOUNT_SID,
  auth_token: AUTH_TOKEN } )
  @sms = sms || SMS.new(config)
  @menu = menu
  @order = order || Order.new(menu)
  end

  def print_menu
    menu.print
  end

  def order_takeaway(dishes)
    add_dishes_order(dishes)
    sms.send_text
    order.total
  end

  private

  attr_reader :menu, :order, :sms

  def add_dishes_order(dishes)
    dishes.map do |dish, quantity|
      order.add(dish, quantity)
    end
  end
end
