require 'twilio-ruby'
require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :takeaway, :menu, :current_order

  def initialize(takeaway, menu = Menu.new)
    @menu = menu
    @takeaway = takeaway
    # @client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
  end

  def checkout_order(amount)
    fail 'Insufficient payment! Please retry.' if amount < @takeaway.order.calc_total
    @takeaway.reset
    send_message
  end

  def send_message
    # @client.account.messages.create(
    client = Twilio::REST::Client.new ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"]
    client.account.messages.create(
      from: ENV["TWILIO_FROM_NO"],
      to: ENV["TWILIO_TO_NO"],
      body: "Thank you for your custom! Your order will be delivered before #{(Time.now + 3600).strftime("%R")}."
    )
    message = "Thanks. Check your mobile for the delivery time!"
  end

end
