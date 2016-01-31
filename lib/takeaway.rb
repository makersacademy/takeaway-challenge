require 'twilio-ruby'
require 'dotenv'
require_relative 'menu'
require_relative 'order'

class Takeaway
  DELIVERY_TIME = 1

  attr_reader :menu, :order

  def initialize(phone, menu = Menu.new, order = Order.new)
    @phone = phone
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.display_menu
  end

  def select_dishes(dishes)
    dishes.each do |item, quantity|
      @order.add(item, quantity) if @menu.has_dish?(item)
    end
    @order.basket
  end

  def checkout
    total = @order.order_total
    "You\'ve ordered #{total} items."
  end

  def confirm_order(number)
    raise 'Total number of dishes does not match. Please check again.' unless total_correct?(number)
    message = "Thank you! Your order was placed and will be delivered before #{delivery_clock}. Total price is £#{bill_total}"
    send_text(message)
    message
  end

  private

  def total_correct?(number)
    @order.order_total == number
  end

  def bill_total
    @order.basket.map { |k, v| menu.display_menu[k] * v }.reduce(:+)
  end

  def delivery_clock
    t = Time.new + 60 * 60 * DELIVERY_TIME
    t.strftime "%H:%M"
  end

  def send_text(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    from_phone = ENV['TWILIO_PHONE']
    to_phone = @phone#ENV['TWILIO_DESTINATION_PHONE']

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create({
      from: Dotenv.load['TWILIO_PHONE'],
      to: to_phone,
      body: message
    })
  end
end
